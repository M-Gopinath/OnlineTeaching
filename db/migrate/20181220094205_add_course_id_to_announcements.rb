class AddCourseIdToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_reference :announcements, :course, foreign_key: true
  end
end
