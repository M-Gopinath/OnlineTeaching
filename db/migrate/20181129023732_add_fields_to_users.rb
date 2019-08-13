class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    unless column_exists? :users, :last_name
      add_column :users, :last_name, :string
    end
    unless column_exists? :users, :user_name
      add_column :users, :user_name, :string
    end
    rename_column :clients, :firstname, :first_name
  end
end
