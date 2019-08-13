class CreateCourseAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :course_attachments do |t|
      t.string :attachment
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
