class ChangeColumnToEvents < ActiveRecord::Migration[5.2]
  def self.up
    change_column :events, :is_public, :boolean, using: "is_public::boolean"
    change_column :events, :is_active, :boolean, using: "is_public::boolean"
    change_column :events, :from_date, :datetime, using: "from_date::timestamp"
    change_column :events, :to_date, :datetime, using: "to_date::timestamp"
  end

  def self.down
    change_column :events, :is_public, :string
    change_column :events, :is_active, :string
    change_column :events, :from_date, :string
    change_column :events, :to_date, :string
  end
end
