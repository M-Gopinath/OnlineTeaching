class CreateClientTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :client_types do |t|
      t.string :name
      t.string :short_name
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
