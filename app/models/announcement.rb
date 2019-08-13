class Announcement < ApplicationRecord
  scope :non_archive, -> {where(archive: false)}
  belongs_to :course, optional: true
  belongs_to :user, optional: true
  has_many :notification_activities, class_name: "NotificationActivity", foreign_key: "notification_id"
  def announcement_users
    case self.to_whom
    when "All"
      User.all
    when "Students"
      course = self.course
      if course.present?
        course.users.uniq.map{|u| u if u.student?}.compact 
      else
        User.all.map{|u| u if u.student?}.compact
      end
    when "Teachers"
      User.teacher
    else
      User.where(id: self.create_by)
    end
  end
end
