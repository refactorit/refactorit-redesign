class PostBelongsToTopic < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :topic, index: true, foreign_key: true
  end
end
