class Course < ApplicationRecord
  has_many :course_images, dependent: :destroy
  has_many :course_videos, dependent: :destroy
  has_many :course_attachments, dependent: :destroy
  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :lessons, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_one :enroll_course_room, dependent: :destroy
  has_many :course_ratings, dependent: :destroy
  has_many :student_answers, dependent: :destroy
  has_many :activity_questions, dependent: :destroy
  accepts_nested_attributes_for :course_users
  accepts_nested_attributes_for :course_images
  accepts_nested_attributes_for :course_videos
  accepts_nested_attributes_for :course_attachments

  def self.get_setup_course
    self.first.present? ? self.first : self.new
  end

  def self.progress_bar_setup
    course = Course.first
    course.present? && course.name.present? && course.description.present? && course.start_date.present? && course.end_date.present? && course.subtitle.present? && course.course_attachments.present? && course.course_images.present?
  end

  def self.any_activity?
    activities = []
    activities << VideoActivity.all
    activities << AudioActivity.all
    activities << QuizActivity.all
    activities << ReadingActivity.all
    activities << EssayActivity.all
    activities << PageActivity.all
    activities << WritingActivity.all
    activities << DocumentActivity.all
    activities << PresentationActivity.all
    activities << DiscussionActivity.all
    return activities.compact.flatten.length >= 1
  end

  def activities
    total_activities = 0
    lessons.each do |lesson|
      total_activities += lesson.all_activities.count
    end
    return total_activities
  end

  def documents
    total_documents = []
    lessons.each do |lesson|
      total_documents << lesson.audio_activities.map{|m| m.audio_file if m.audio_file.present? }
      total_documents << lesson.document_activities.map{|m| m.document if m.document.present? }
      total_documents << lesson.presentation_activities.map{|m| m.slide_file if m.slide_file.present? }
      total_documents << lesson.reading_activities.map{|m| m.documents if m.documents.present? }
      total_documents << lesson.video_activities.map{|m| m.video if m.video.present? }
    end
    return total_documents.uniq.compact.count
  end

  def all_day_event?
    self.start_date == self.start_date.try(:midnight) && self.end_date == self.end_date.try(:midnight) ? true : false
  end

  def enrolled_teachers
    users.joins(:role).where("roles.name = ?", "Teacher")
  end

  def enrolled_students
    users.joins(:role).where("roles.name = ?", "Student")
  end

  def user_enrolled(user)
    users.include? user
  end

  def self.completed_course
    all.map{|c| c if c.lessons.present? && c.any_activities}.flatten.compact.count
  end

  def self.in_progress_course
    all.map{|c| c if (c.lessons.present? || c.any_activities) && !(c.lessons.present? && c.any_activities)}.flatten.compact.count
  end

  def any_activities
    lessons.map{|l| l.all_activities.present?}
  end

  def check_enrolled(u)
    if users.present?
      users.where(id: u).present? ? true : false 
    else
      false
    end
  end

  def yet_enrolled_students
    all_user = User.student
    enrolled = enrolled_students
    (all_user - enrolled).flatten
  end

  def course_rating(user)
    course_ratings.where(user_id: user.id).present?
  end

  def calculate_avg_rating(user)
    total = course_ratings.count
    rating = course_ratings.collect(&:rating).compact
    rating.present? ? (rating.sum.to_f / total.to_f) : 0.0
  end
  
end
