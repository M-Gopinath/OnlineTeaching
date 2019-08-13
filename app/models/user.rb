class User < ApplicationRecord
  require 'roo'
  include PgSearch
  pg_search_scope :search_by_name_email, against: [:email],
                           using: {
                             tsearch: {prefix: true, any_word: true }}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  acts_as_messageable
  belongs_to :role, optional: true
  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users
  has_many :lesson_users, dependent: :destroy
  has_many :lessons, through: :course_users
  # has_one :course_image, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  has_many :plan_subscriptions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :live_conversations, :foreign_key => :sender_id
  has_many :student_answers
  has_many :enroll_course_messages, dependent: :destroy
  has_many :student_grades
  has_many :notification_activities
  mount_uploader :avatar, AvatarUploader
  has_many :course_chat_likes, dependent: :destroy
  has_many :user_notifications, dependent: :nullify
  has_many :notifications, through: :user_notifications
  has_many :course_rating, dependent: :destroy
  
  scope :teacher, -> {joins(:role).where("roles.name = ?", "Teacher")}
  scope :student, -> {joins(:role).where("roles.name = ?", "Student")}
  scope :admin, -> {joins(:role).where("roles.name IN (?)", ["Admin", "Super Admin"])}
  scope :super_admin, -> {joins(:role).where("roles.name = ?", "Super Admin")}
  scope :except_admins, -> {joins(:role).where.not("roles.name IN (?)", ["Admin", "Super Admin"])}

  scope :active, -> {where("is_active = ?", true)}
  scope :deactive, -> {where("is_active = ?", false)}
  # validates :password, length: { minimum: 8 }
  

  WHOM_COLLECTION = ["All", "Students", "Teachers"]

  def is_super_admin?
    role.name == "Super Admin"
  end

  def admin?
    role.name == "Admin"
  end
  def self.get_user(search, role_name)
    User.search_by_name_email(search).joins(:role).where("roles.name = ?", role_name)
  end

  def self.get_user_with_role(role_name)
    joins(:role).where("roles.name = ?", role_name)
  end

  def update_user_role(new_role)
    new_role = Role.find_by(name: new_role)
    update(role_id: new_role.id) if new_role.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def student?
    role.name == "Student"
  end

  def teacher?
    role.name == "Teacher"
  end

  def mailboxer_email(object)
    email
  end

  def current_active_plan
    plan_subscriptions.where(is_active: true).last
  end

  def admin_super_admin?
    role.name == "Super Admin" || role.name == "Admin"
  end

  def admin_teacher?
    role.name == "Super Admin" || role.name == "Admin" || role.name == "Teacher"
  end

  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end

  def self.export_user(type)
    case type
    when "admin"
      self.admin
    when "teachers"
      self.teacher
    when "students"
      self.student
    else
      self.all
    end
  end

  def self.import_users(file_path)
    spreadsheet = open_spreadsheet(file_path.path)
    error = []
    if spreadsheet != "Unknown file format"
      require 'spreadsheet'
      spreadsheet.each_with_pagename do |name, sheet|
        if sheet.first_row.present?
          h = sheet.row(1)
          (2..sheet.last_row).each do |i|
            begin
              row = Hash[[h, sheet.row(i)].transpose]
              user = new(first_name: row['First Name'], last_name: row['Last Name'], email: row['Email'])
              role = Role.find_by(name: row['role'])
              user.role_id = role.id if role.present?
              pwd = SecureRandom.hex(4)
              user.password = pwd
              user.password_confirmation = pwd
              user.subdomain = Apartment::Tenant.current
              if user.save
                UserMailer.welcome_email(user,pwd).deliver
              else
                p user.errors.full_messages
                error << user.errors.full_messages.join(',')
              end
            rescue Exception => e
              error << e
            end
          end
        end
      end
    else
      error << "Unknown file format"
    end
    return error
  end

  def self.open_spreadsheet(file)
    case File.extname(file)
    when '.csv' then Roo::CSV.new(file, extension: :ignore)
    when '.xls' then Roo::Excel.new(file, extension: :ignore)
    when '.xlsx' then Roo::Excelx.new(file, extension: :ignore)
    else
      "Unknown file format"
    end
  end

  def unread_announcements
    ids = notification_activities.collect(&:notification_id)
    announcements = Announcement.where.not(id: ids).order(id: :desc)
  end

  def unread_mailboxes
    messages = mailbox.inbox(:unread => true).order(id: :desc)
  end

  def unread_events
    user_notifications.joins(:notification).where("notifications.notificable_type =?","Event").unread.order(id: :desc)
  end

  def unread_direct_charts
    messages = LiveMessage.joins(:live_conversation).where("live_messages.is_read = ?",false).where.not("live_messages.user_id = ?",id)
    return messages + unread_posts + unread_course_chats
  end

  def unread_posts
    user_notifications.joins(:notification).where("notifications.notificable_type =?","Post").unread.order(id: :desc)
  end

  def unread_course_chats
    user_notifications.joins(:notification).where("notifications.notificable_type =?","EnrollCourseMessage").unread.order(id: :desc)
  end

  def unread_announment_template
    ApplicationController.renderer.render(partial: '/layouts/announcement_notification', locals: {notifications: self.unread_announcements,current_user: self})
  end

  def unread_mailbox_template
    ApplicationController.renderer.render(partial: '/layouts/message_notification', locals: {notifications: self.unread_mailboxes,current_user: self})
  end

  def unread_event_template
    ApplicationController.renderer.render(partial: '/layouts/event_notification', locals: {notifications: self.unread_events,current_user: self})
  end

  def unread_charts_notification_template
    ApplicationController.renderer.render(partial: '/layouts/direct_charts_notification', locals: {notifications: self.unread_direct_charts,current_user: self})
  end

  def self.teacher_for_course_enroll(course)
    course.present? ? User.teacher.joins(:courses).where("courses.id = ?",course.try(:id)) : []
  end

  def self.admin_for_course_enroll(course)
    course.present? ? User.admin.joins(:courses).where("courses.id = ?",course.try(:id)) : []
  end

  def self.student_for_course_enroll(course)
    course.present? ? User.student.joins(:courses).where("courses.id = ?",course.try(:id)) : []
  end

  def enrolled_course_list
    Course.joins(:course_users).where("course_users.user_id = ?",self.id)
  end

  def self.profile_photo
    self.admin.first.avatar.present? ? self.admin.first.avatar.url : "/assets/avatar-150.png"
  end

end
