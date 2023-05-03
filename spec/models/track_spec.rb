require 'rails_helper'

RSpec.describe Track, type: :model do
  subject { 
    described_class.new(name: "My Track",
                        overview: "This is a track",
                        phone: "1234567890",
                        email: "email@track.com"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an overview" do
    subject.overview = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
end
