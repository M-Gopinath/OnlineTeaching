class AddStripeIdToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :stripe_id, :text
  end
end
