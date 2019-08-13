class CreateCourseImages < ActiveRecord::Migration[5.2]
  def change
    create_table :course_images do |t|
      t.string :image
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
