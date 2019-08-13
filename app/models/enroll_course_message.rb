class EnrollCourseMessage < ApplicationRecord
  belongs_to :course
  belongs_to :enroll_course_room
  belongs_to :user
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { CourseBroadcastJob.perform_later(self) }
  belongs_to :parent,  class_name: "EnrollCourseMessage", optional: true
  has_many   :replies, class_name: "EnrollCourseMessage", foreign_key: :parent_id, dependent: :destroy
  has_many :course_chat_attachments, dependent: :destroy
  accepts_nested_attributes_for :course_chat_attachments
  has_many :course_chat_likes, dependent: :destroy
  has_one :enroll_course_notification, as: :notificable, class_name: "Notification"

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def user_like_status(user)
    user_like(user) ? "Unlike" : "Like"
  end

  def user_like(user)
    course_chat_likes.where("user_id = ?", user.id).any?
    self.course_chat_likes.where("course_chat_likes.user_id = ?", user.id).any?
  end
  
end
