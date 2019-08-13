class ActivityQuestion < ApplicationRecord
	belongs_to :activity, polymorphic: true, optional: true
  has_many :activity_answers, dependent: :destroy
  has_many :student_answers, dependent: :destroy
  belongs_to :course, optional: true
  accepts_nested_attributes_for :activity_answers,
                                allow_destroy: true,
                                reject_if: proc { |att| att["name"].blank?}
end
