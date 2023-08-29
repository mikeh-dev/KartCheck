require 'rails_helper'

RSpec.describe Engine, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:make) }
  end

end
