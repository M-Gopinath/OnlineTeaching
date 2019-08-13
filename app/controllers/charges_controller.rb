class ChargesController < ApplicationController

  def create
    card_token = params[:stripeToken]
    plan = Plan.find_by_id params[:plan_id]
    template = plan.client_templates.order('created_at asc').first
    begin
      if current_user.stripe_customer_id
        customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      else
        customer = Stripe::Customer.create(source: card_token, email: current_user.email)
        current_user.update_attributes(stripe_customer_id: customer.id)
      end

      stripe_subscription = customer.subscriptions.create(:plan => plan.stripe_id)

      start_date = Time.at(stripe_subscription.current_period_start).to_datetime
      end_date = Time.at(stripe_subscription.current_period_end).to_datetime

      current_user.plan_subscriptions.where(is_active: true).update_all(is_active: false)

      current_account.update_attributes(client_template_id: template.id)
      subscriber = current_user.plan_subscriptions.build(plan_id: plan.id, stripe_customer_id: customer.id,subscribed_at: start_date,expiry_at: end_date,is_active: true, subscription_id: stripe_subscription.id)
      subscriber.save
    rescue Exception => e
      p "Error #{e}"
      
    end
  end

  def upcoming_invoice

    subscription_id = current_user.current_active_plan.subscription_id
    @plan = Plan.find(params[:plan_id])
    proration_date = Time.now.to_i
    subscription = Stripe::Subscription.retrieve(subscription_id)
    # New Plan
    items = [{
      id: subscription.items.data[0].id,
      plan: @plan.stripe_id, # Switch to new plan
    }]

    subscription.prorate = true

    # Upcoming Invoice detail
    p "Upcoming Invoice detail"
    p @invoice = Stripe::Invoice.upcoming({
        customer: current_user.stripe_customer_id,
        subscription: subscription_id,
        subscription_items: items,
        subscription_proration_date: proration_date,
    })

    # Calculate the proration cost:
    current_prorations = @invoice.lines.data.select { |ii| ii.period.start == proration_date }
    @cost = 0
    current_prorations.each do |p|
        @cost += p.amount
    end
    p "@cost"
    p @cost
  end

  def update_subscription
    subscription_id = current_user.current_active_plan.subscription_id
    plan = Plan.find(params[:plan_id])
    proration_date = Time.now.to_i
    subscription = Stripe::Subscription.retrieve(subscription_id)
    items = [{
      id: subscription.items.data[0].id,
      plan: plan.stripe_id, # Switch to new plan
    }]
    subscription.items = items
    subscription.prorate = true
    p subscription.save
  end

end
