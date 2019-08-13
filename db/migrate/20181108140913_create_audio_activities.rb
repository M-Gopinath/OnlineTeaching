class CreateAudioActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_activities do |t|
      t.string :name
      t.string :audio_file
      t.string :embedded_audio
      t.date :due_date
      t.boolean :publish
      t.boolean :required
      t.integer :activity_points
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
