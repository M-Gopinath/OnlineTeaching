class CreateActivityQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_questions do |t|
      t.string :field_type
      t.string :name
      t.integer :activity_id
      t.string :activity_type

      t.timestamps
    end
  end
end
