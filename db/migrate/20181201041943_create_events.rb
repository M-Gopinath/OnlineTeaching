class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :from_date
      t.string :to_date
      t.string :is_active
      t.string :is_public
      t.string :created_by
      t.references :event_attendee_group, foreign_key: true

      t.timestamps
    end
  end
end
