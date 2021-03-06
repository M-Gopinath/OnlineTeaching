class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
