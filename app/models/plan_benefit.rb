class PlanBenefit < ApplicationRecord
  belongs_to :plan, optional: true
end
