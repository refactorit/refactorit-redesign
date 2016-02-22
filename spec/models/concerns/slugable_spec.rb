require 'rails_helper'

describe Slugable do
  let(:dummy_metaclass) { Class.new { include Slugable } }
  let(:instance) { dummy_metaclass.new }

  it "returns correctly slugified text" do
    text = "This is a rails 5 text"
    expect(instance.slugify(text)).to eq "this-is-a-rails-5-text"
  end

  it "returns correctly slugified text with multiple whitespace" do
    text = "Title WIth    whitespace"
    expect(instance.slugify(text)).to eq "title-with-whitespace"
  end

  it "correctly transliterates diacritics" do
    text = "Ivan Lučev"
    expect(instance.slugify(text)).to eq "ivan-lucev"
  end

  it "returns correctly slugified text with outer whitespace " do
    text = "     Someone copy pasted weirdly     "
    expect(instance.slugify(text)).to eq "someone-copy-pasted-weirdly"
  end
end
