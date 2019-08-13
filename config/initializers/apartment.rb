# require 'apartment/elevators/subdomain'
Apartment.configure do |configure|
  configure.excluded_models = %w{Client Plan PlanBenefit Discount ClientTemplate ClientSubscription}
  configure.tenant_names = lambda{ Client.pluck(:subdomain) }
end
