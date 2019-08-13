class Plan < ApplicationRecord
  has_many :plan_benefits, dependent: :destroy
  has_many :client_templates, dependent: :destroy
  # has_many :plan_subscriptions, dependent: :destroy
  scope :active, -> {includes(:plan_benefits).where(is_active: true).order('CAST(plans.cost AS Decimal) ASC')}
  def self.premium
    Plan.find_by(name: "Premium")
  end
end
