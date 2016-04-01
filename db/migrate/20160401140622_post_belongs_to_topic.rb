class PostBelongsToTopic < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :topics, index: true
  end
end
