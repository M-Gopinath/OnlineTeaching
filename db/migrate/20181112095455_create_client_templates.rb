class CreateClientTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :client_templates do |t|
      t.string :name
      t.string :image
      t.boolean :is_active, default: true
      t.boolean :is_paid, default: false
      t.boolean :is_free, default: false

      t.timestamps
    end
  end
end
