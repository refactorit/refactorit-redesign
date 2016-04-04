class ChangeDribbbleShotsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :dribbble_shots, :teaser_image_url, :image_url
  end
end
