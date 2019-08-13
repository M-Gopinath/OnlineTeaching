class AddIsReadToLiveMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :live_messages, :is_read, :boolean, default: false
  end
end
