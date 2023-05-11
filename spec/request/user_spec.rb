require 'rails_helper'

RSpec.describe 'User', type: :request do

  describe 'user accessing signup page' do
    it 'succeeds' do
      get new_user_registration_path
      expect(response).to be_successful
      get new_user_session_path
      expect(response).to be_successful
    end

  describe 'user accessing login page' do
    it 'succeeds' do
      get new_user_session_path
      expect(response).to be_successful
      end
    end
  end
  
end