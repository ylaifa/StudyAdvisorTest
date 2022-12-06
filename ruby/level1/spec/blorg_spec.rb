require_relative '../blorg'

describe "class Blorg" do 
  let(:blorg) {Blorg.new}

  it "is creatable" do
    expect(blorg.class).to eq(Blorg)
  end
end