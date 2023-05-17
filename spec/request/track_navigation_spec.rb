require 'rails_helper'

RSpec.describe 'Track', type: :request do

    track = FactoryBot.create(:track)
  
    describe 'user accessing track page' do
      it 'succeeds' do
        get tracks_path
        expect(response).to be_successful
      end

      it 'succeeds' do
        get track_path(track)
        expect(response).to be_successful
      end
    end

    describe 'user accessing new track page' do
      it 'does not succeed' do
        get new_track_path
        expect(response).to_not be_successful
      end
    end
end