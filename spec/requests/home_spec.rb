require 'rails_helper'

RSpec.describe 'Home', type: :request do

  describe 'GET /' do
    it 'succeeds' do
      get root_path
      expect(response).to be_successful
    end
  end

  describe 'GET /about' do
    it 'succeeds' do
      get about_path
      expect(response).to be_successful
    end
  end

  describe 'GET /contact' do
    it 'succeeds' do
      get contact_path
      expect(response).to be_successful
    end
  end

  describe 'GET /calendar' do
    it 'succeeds' do
      get calendar_path
      expect(response).to be_successful
    end
  end
end