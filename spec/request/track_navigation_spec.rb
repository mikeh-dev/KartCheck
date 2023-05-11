require 'rails_helper'

RSpec.describe 'Track', type: :request do

    track = FactoryBot.create(:track)
  
    describe 'user accessing track page' do
      it 'succeeds' do
        get tracks_path
        expect(response).to be_successful
      end

      it 'succeeds' do
        get track_path(1)
        expect(response).to be_successful
      end
  
    end

end