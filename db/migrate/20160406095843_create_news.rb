class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string     :title, null: false
      t.string     :description, null: false
      t.string     :published_at
      t.string     :url

      t.timestamps
    end
  end
end
