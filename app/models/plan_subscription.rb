class PlanSubscription < ApplicationRecord
  # belongs_to :plan, optional: true
  belongs_to :user, optional: true
  belongs_to :plan, optional: true
end
