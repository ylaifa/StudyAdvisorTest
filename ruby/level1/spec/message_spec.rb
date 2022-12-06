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

describe "translate_one_letter method" do
  let(:blorg_message) {Message.new("burh", false)}
  let(:french_message) {Message.new("H", true)}

  it "is translatable" do
    expect(blorg_message.translate_one_letter("burh")).to eq("H")
    expect(french_message.translate_one_letter("D")).to eq("olgr")
  end
end

describe "encode method" do 
  let(:first_message) {Message.new("HELLO", true)}
  let(:second_message) {Message.new("WORLD !", true)}

  it "is encodable" do
    expect(first_message.encode).to eq("burh lorh grbl grbl rgob")
    expect(second_message.encode).to eq("ruob rgob ogru grbl olgr  rblg")
  end
end

describe "decode method" do 
  let(:first_message) {Message.new("burh lorh grbl grbl rgob", false)}
  let(:second_message) {Message.new("ruob rgob ogru grbl olgr  rblg", false)}
  
  it "is decodable" do
    expect(first_message.decode).to eq("HELLO")
    expect(second_message.decode).to eq("WORLD !")
  end
end

describe "set_french_message method" do
  let(:first_french_message) {Message.new("Hello World !", true)}
  let(:second_french_message) {Message.new("Héllo :-)", true)}

  it "is checkable" do
    expect(first_french_message.set_french_message).to eq("HELLO WORLD !")
    expect(second_french_message.set_french_message).to eq("Merci d'enter un message valide")
  end
end
