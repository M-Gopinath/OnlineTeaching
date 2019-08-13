class AddToWhomToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :to_whom, :string
    add_column :events, :color, :string
    add_column :events, :course_id, :integer
  end
end
