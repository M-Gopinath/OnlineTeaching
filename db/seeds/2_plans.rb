Stripe::Plan.list.data.map{|m| m if m.interval == "month" }.compact.each do |stripe_plan|
  plan = Plan.find_or_create_by(name: stripe_plan.nickname)
  plan.update_attributes(short_name: stripe_plan.nickname, duration: stripe_plan.interval_count, cost: stripe_plan.amount.to_f/100, is_active: true, stripe_id: stripe_plan.id,duration_type: stripe_plan.interval)
end

# Basic Plan
basic_plans = Plan.where("name ILIKE ?", "%basic%")
basic_plans.each do |plan|
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "50 Teachers")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "100 Students")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "10 Courses")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "100 Lessons")
	plan.update_attributes(storage_limit: 5)
end

# Premium Plan
premium_plans = Plan.where("name ILIKE ?", "%premium%")
premium_plans.each do |plan|
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "100 Teachers")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "150 Students")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "20 Courses")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "150 Lessons")
	plan.update_attributes(storage_limit: 10)
end

# Enterprise Plan
enterprise_plans = Plan.where("name ILIKE ?", "%enterprise%")
enterprise_plans.each do |plan|
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "150 Teachers")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "200 Students")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "50 Courses")
	PlanBenefit.find_or_create_by(plan_id: plan.id, name: "200 Lessons")
	plan.update_attributes(storage_limit: 20)
end

Discount.find_or_create_by(name: "Diwali", description: "Discount for Diwali", plan_id: 1, discount_cost: 40, is_active: false)
Discount.find_or_create_by(name: "Pongal", description: "Discount for Pongal", plan_id: 2, discount_cost: 75, is_active: false)
