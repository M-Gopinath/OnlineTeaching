class AddFieldsToClientTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :client_templates, :plan_id, :integer
    add_column :users, :stripe_customer_id, :string
  end
end
