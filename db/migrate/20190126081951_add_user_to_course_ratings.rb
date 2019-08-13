class AddUserToCourseRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_ratings, :user, foreign_key: true
  end
end
