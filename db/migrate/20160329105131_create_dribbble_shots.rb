class CreateDribbbleShots < ActiveRecord::Migration[5.0]
  def change
    create_table :dribbble_shots do |t|
      t.string :title
      t.integer :views_count
      t.integer :likes_count
      t.string :html_url
      t.string :teaser_image_url
      t.text :response_body

      t.timestamps
    end
  end
end
