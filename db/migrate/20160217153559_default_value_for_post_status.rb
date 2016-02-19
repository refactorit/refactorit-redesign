class DefaultValueForPostStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :status, :integer, default: 0, index: true
  end
end
