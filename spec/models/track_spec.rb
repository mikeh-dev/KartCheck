require 'rails_helper'

RSpec.describe Track, type: :model do
  subject { 
    described_class.new(name: "My Track",
                        overview: "This is a track",
                        phone: "1234567890",
                        email: "email@track.com"
    )
  }

  describe 'validations' do
    it { should validate_presence_of(:name) and validate_uniqueness_of(:name)}
    it { should validate_presence_of(:overview) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should have_many_attached(:images) }
  end  
  
end
