class AddDribbbleIdToDribbbleShots < ActiveRecord::Migration[5.0]
  def change
    add_column :dribbble_shots, :dribbble_id, :integer
  end
end
