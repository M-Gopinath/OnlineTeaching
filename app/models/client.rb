class Client < ApplicationRecord
  RESTRICTED_SUBDOMAINS = %w(www)
  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message:'contains invalid charactors' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message:'restricted' }

  before_validation :downcase_subdomain

  belongs_to :client_template, optional: true
  has_many :client_subscriptions, dependent: :destroy

  def subscription(plan)
    start_date = Date.today
    end_date = (Date.today + plan.duration.to_i.months)
    client_sub = client_subscriptions.build(plan_id: plan.id, subscription_start_date: start_date, subscription_end_date: end_date, cost: plan.cost)
    client_sub.save
  end

  private

  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end

end
