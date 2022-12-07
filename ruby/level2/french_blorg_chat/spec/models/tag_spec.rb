require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is creatable" do 
    tag = create(:tag)
    first_tag = Tag.first
    expect(first_tag.name).to eq(tag.name)
  end
end
