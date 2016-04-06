class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string       :title, null: false
      t.string       :description, null: false
      t.datetime     :published_at
      t.boolean      :published
      t.string       :url

      t.timestamps
    end
  end
end
