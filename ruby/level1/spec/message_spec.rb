require_relative '../message'

describe "class Message" do
  let(:message) {Message.new("HELLO", true)}

  it "is creatable" do 
    expect(message.content).to eq("HELLO")
    expect(message.is_french).to eq(true)
  end
end