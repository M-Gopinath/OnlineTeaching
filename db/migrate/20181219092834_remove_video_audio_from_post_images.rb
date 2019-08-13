class RemoveVideoAudioFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :video, :string
    remove_column :post_images, :audio, :string
  end
end
