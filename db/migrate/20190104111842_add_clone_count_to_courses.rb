class AddCloneCountToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :clone_count, :integer, default: 0
  end
end
