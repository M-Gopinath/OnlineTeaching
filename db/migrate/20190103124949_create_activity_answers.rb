class CreateActivityAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_answers do |t|
      t.string :name
      t.integer :activity_question_id
      t.boolean :is_correct

      t.timestamps
    end
  end
end
