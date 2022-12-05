require_relative '../message'

describe "class Message" do
  let(:message) {Message.new("HELLO", true)}

  it "is creatable" do 
    expect(message.content).to eq("HELLO")
    expect(message.is_french).to eq(true)
  end
end

describe "normalize method" do
  let(:blorg_message) {Message.new("BURH LORH GRBL GRBL RGOB", false)}
  let(:french_message) {Message.new("hello", true)}
  
  it "is normalizable" do
    expect(blorg_message.normalize).to eq("burh lorh grbl grbl rgob")
    expect(french_message.normalize).to eq("HELLO")
  end
end
