class CreatePresentationActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :presentation_activities do |t|
      t.string :name
      t.string :slide_file
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.integer :activity_points
      t.text :description
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
