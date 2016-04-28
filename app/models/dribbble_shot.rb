class DribbbleShot < ApplicationRecord
  validates :dribbble_id, uniqueness: true
end
