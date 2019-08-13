class CreateReadingActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_activities do |t|
      t.string :name
      t.string :documents
      t.text :assignment
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.integer :activity_points

      t.timestamps
    end
  end
end
