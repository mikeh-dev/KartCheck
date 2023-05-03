require 'rails_helper'

RSpec.describe Track, type: :model do
  subject { FactoryBot.build(:track) }

  describe 'validations' do
    it { should validate_presence_of(:name) and validate_uniqueness_of(:name)}
    it { should validate_presence_of(:overview) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should have_many_attached(:images) }
    it { should validate_presence_of(:opening_time) }
  end
 

end

