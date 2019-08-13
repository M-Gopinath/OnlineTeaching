class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :subdomain
      t.string :orgination_name
      t.boolean :is_confirmed, default: false
      t.integer :owner_id

      t.timestamps
    end
  end
end
