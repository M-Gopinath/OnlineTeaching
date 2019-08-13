class AddAudioVideoToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :audio, :string
    add_column :post_images, :video, :string
  end
end
