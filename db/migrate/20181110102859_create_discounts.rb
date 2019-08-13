class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.references :plan, foreign_key: true
      t.float :discount_cost
      t.boolean :is_active

      t.timestamps
    end
  end
end
