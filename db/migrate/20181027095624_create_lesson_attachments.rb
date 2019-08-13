class CreateLessonAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_attachments do |t|
      t.string :attachment
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
