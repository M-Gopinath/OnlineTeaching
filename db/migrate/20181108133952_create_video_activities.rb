class CreateVideoActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :video_activities do |t|
      t.string :name
      t.string :video
      t.string :embedded_video
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.references :lesson, foreign_key: true
      t.integer :activity_points

      t.timestamps
    end
  end
end
