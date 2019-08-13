class CreateDocumentActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :document_activities do |t|
      t.string :name
      t.string :document
      t.string :file_url
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
