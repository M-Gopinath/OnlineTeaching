Plan.all.each.with_index(1) do |plan,index|
  ClientTemplate.find_or_create_by(name: "Template-#{index}", is_paid: true, plan_id: plan.id)
end
