class CreatePageActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :page_activities do |t|
      t.string :name
      t.text :description
      t.integer :activity_points
      t.date :due_date
      t.boolean :required
      t.boolean :publish
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
