class CreatePlanSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_subscriptions do |t|
      t.integer :plan_id
      t.datetime :subscribed_at
      t.datetime :expiry_at
      t.references :user, foreign_key: true
      t.boolean :is_active, default: :false
      t.text :stripe_customer_id
      t.string :subscription_id

      t.timestamps
    end
  end
end
