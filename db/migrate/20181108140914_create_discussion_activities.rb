class CreateDiscussionActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_activities do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.integer :activity_points
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
