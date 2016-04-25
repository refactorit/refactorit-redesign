require 'rails_helper'

RSpec.describe DribbbleShot, :type => :model do
  it { should validate_uniqueness_of(:dribbble_id) }
end
