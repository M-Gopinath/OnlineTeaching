class CreateQuizActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_activities do |t|
      t.string :name
      t.references :lesson, foreign_key: true
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.integer :activity_points

      t.timestamps
    end
  end
end
