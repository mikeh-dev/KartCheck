require 'rails_helper'

RSpec.describe Engine, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:make) }
  end

  describe "CORRECT THIS TEST NAME" do
    let!(:user1) { create(:user) }
    let!(:engine1) { create(:engine, engine_number: "CY1234", user: user1) }
    let!(:engine2) { create(:engine, engine_number: "HY5678", user: user1) }
    let!(:engine3) { create(:engine, engine_number: "XY9999", user: user1) }

    it "returns engines with matching engine_number prefix" do
      results = Engine.search_engine_number("CY")
      expect(results).to include(engine1)
      expect(results).not_to include(engine2, engine3)
    end
  end
end
