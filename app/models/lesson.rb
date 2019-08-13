class Lesson < ApplicationRecord
  belongs_to :course, optional: true
  has_many :lesson_images, dependent: :destroy
  has_many :lesson_videos, dependent: :destroy
  has_many :lesson_attachments, dependent: :destroy
  has_many :lesson_users, dependent: :destroy
  has_many :users, through: :lesson_users
  has_many :video_activities, dependent: :destroy
  has_many :audio_activities, dependent: :destroy
  has_many :quiz_activities, dependent: :destroy
  has_many :reading_activities, dependent: :destroy
  has_many :essay_activities, dependent: :destroy
  has_many :page_activities, dependent: :destroy
  has_many :writing_activities, dependent: :destroy
  has_many :document_activities, dependent: :destroy
  has_many :presentation_activities, dependent: :destroy
  has_many :discussion_activities, dependent: :destroy

  def all_activities
    activities = []
    activities << video_activities
    activities << audio_activities
    activities << quiz_activities
    activities << reading_activities
    activities << essay_activities
    activities << page_activities
    activities << writing_activities
    activities << document_activities
    activities << presentation_activities
    activities << discussion_activities.each do |discussion|
    end
    activities.compact.flatten
  end

  def all_day_event?
    self.start_date == self.start_date.try(:midnight) && self.end_date == self.end_date.try(:midnight) ? true : false
  end

  def self.progress_bar_setup
    lesson = Lesson.last
    lesson.present? && lesson.name.present? && lesson.description.present? && lesson.start_date.present? && lesson.end_date.present?
  end

  def self.activity_progress_bar_setup
    lesson = Lesson.last
    lesson.present? && lesson.video_activities.present? && lesson.audio_activities.present? && lesson.quiz_activities.present? && lesson.reading_activities.present? && lesson.essay_activities.present? && lesson.page_activities.present? && lesson.writing_activities.present? && lesson.document_activities.present? && lesson.presentation_activities.present? && lesson.discussion_activities.present?
  end

  def clone_activities
    video_activities.each do |video|
      new_video = video.dup
      new_video.lesson_id = id
      new_video.save
    end
    audio_activities.each do |audio|
      new_audio = audio.dup
      new_audio.lesson_id = id
      new_audio.save
    end
    quiz_activities.each do |quiz|
      new_quiz = quiz.dup
      new_quiz.lesson_id = id
      new_quiz.save
    end
    reading_activities.each do |reading|
      new_reading = reading.dup
      new_reading.lesson_id = id
      new_reading.save
    end
    essay_activities.each do |essay|
      new_essay = essay.dup
      new_essay.lesson_id = id
      new_essay.save
    end
    page_activities.each do |page|
      new_page = page.dup
      new_page.lesson_id = id
      new_page.save
    end
    writing_activities.each do |writing|
      new_writing = writing.dup
      new_writing.lesson_id = id
      new_writing.save
    end
    document_activities.each do |document|
      new_document = document.dup
      new_document.lesson_id = id
      new_document.save
    end
    presentation_activities.each do |presentation|
      new_presentation = presentation.dup
      new_presentation.lesson_id = id
      new_presentation.save
    end
    discussion_activities.each do |discussion|
      new_discussion = discussion.dup
      new_discussion.lesson_id = id
      new_discussion.save
    end
  end
end
