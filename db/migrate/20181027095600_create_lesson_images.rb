class CreateLessonImages < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_images do |t|
      t.string :image
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
