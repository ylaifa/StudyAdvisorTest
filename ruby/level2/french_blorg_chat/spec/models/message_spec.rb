require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is creatable" do 
    message = create(:message)
    first_message = Message.first
    expect(first_message.author).to eq(message.author)
    expect(first_message.content).to eq(message.content)
    expect(first_message.is_french).to eq(true)
  end

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:is_french) }
end
