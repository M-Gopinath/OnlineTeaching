class ReadingActivity < ApplicationRecord
  belongs_to :lesson, optional: true
  mount_uploader :documents, FileUploader
  validate :file_size_validation
  has_many :activity_questions, as: :activity, dependent: :destroy
  has_many :student_answers, as: :activity_answer, dependent: :destroy
  has_many :student_grades, as: :activity, dependent: :destroy
  accepts_nested_attributes_for :activity_questions, allow_destroy: true, reject_if: proc { |att| att["name"].blank?}

  def all_day_event?
    self.due_date == self.due_date.try(:midnight) ? true : false
  end
  private

  def file_size_validation
    errors[:documents] << "should be less than 10MB" if documents.size > 10.megabytes
  end
end
