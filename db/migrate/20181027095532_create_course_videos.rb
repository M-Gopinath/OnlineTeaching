class CreateCourseVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :course_videos do |t|
      t.string :video
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
