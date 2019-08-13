class AddFieldsToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :client_type, foreign_key: true
    add_column :clients, :firstname, :string
    add_column :clients, :last_name, :string
    add_column :clients, :user_name, :string
  end
end
