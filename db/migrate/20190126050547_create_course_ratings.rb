class CreateCourseRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :course_ratings do |t|
      t.references :course, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
