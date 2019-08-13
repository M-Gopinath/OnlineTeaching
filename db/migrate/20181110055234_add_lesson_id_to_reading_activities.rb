class AddLessonIdToReadingActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_activities, :lesson_id, :integer
    add_column :writing_activities, :description, :text
  end
end
