class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :short_name
      t.float :duration
      t.string :cost
      t.boolean :is_active

      t.timestamps
    end
  end
end
