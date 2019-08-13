class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :creator_id
      t.boolean :is_required, default: false
      t.boolean :is_publish, default: false
      t.boolean :is_complete, default: false

      t.timestamps
    end
  end
end
