class CreateClientSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :client_subscriptions do |t|
      t.references :client, foreign_key: true
      t.references :plan, foreign_key: true
      t.date :subscription_start_date
      t.date :subscription_end_date
      t.string :discount_id
      t.float :cost

      t.timestamps
    end
  end
end
