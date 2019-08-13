class AddExtraFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :subtitle, :string
    add_column :courses, :objectives, :text
  end
end
