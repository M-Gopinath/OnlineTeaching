class StudentAnswer < ApplicationRecord
	belongs_to :activity_question, optional: true
  belongs_to :user, optional: true
  belongs_to :activity_answer, polymorphic: true, optional: true
  has_one :student_grade, dependent: :destroy

  def check_grade_activity(activity, type)
    case type
    when "all"
      StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: self.user.id, student_answer_id: self.id)
    when "month"
      StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: self.user.id, student_answer_id: self.id, created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    when "week"
      StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: self.user.id, student_answer_id: self.id, created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
    when "today"
      StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: self.user.id, student_answer_id: self.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end
  end
end
