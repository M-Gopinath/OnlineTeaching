class Event < ApplicationRecord
  attr_accessor :date_range
  belongs_to :event_attendee_group, optional: true
  belongs_to :course, optional: true
  belongs_to :user, optional: true
  has_one :event_notification, as: :notificable, class_name: "Notification"

  def all_day_event?
    self.from_date == self.from_date.try(:midnight) && self.to_date == self.to_date.try(:midnight) ? true : false
  end

  def event_users
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

  def self.today_events
    Event.where("from_date <= ? and to_date >= ?",Time.now.end_of_day,Time.now)
  end

  def self.completed_events
    Event.where("to_date <= ?",Time.now.beginning_of_day)
  end

  def self.new_events
    Event.where("created_at >= ? and created_at <= ?",Time.now.beginning_of_day,Time.now.end_of_day)
  end

  def self.current_week_events
    Event.where("from_date <= ? and to_date >= ?",Time.now.end_of_week,Time.now)
  end

  def self.current_month_events
    Event.where("from_date <= ? and to_date >= ?",Time.now.end_of_month,Time.now)
  end

end
