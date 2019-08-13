class CreateLessonVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_videos do |t|
      t.string :video
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
