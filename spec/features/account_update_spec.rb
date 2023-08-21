require 'rails_helper'

RSpec.describe 'Account Update', type: :feature do
  let(:user) { create(:user) }
  let(:new_email) { 'new_email@example.com' }
  let(:new_password) { 'new_password' }

  describe 'when user is signed in' do
    before do
      sign_in user
      visit edit_user_registration_path(user)
    end

    scenario 'user updates email address' do
      fill_in 'Email', with: new_email
      fill_in 'Current password', with: user.password
      click_button 'Update'

      expect(page).to have_text 'Your account has been updated successfully.'
      expect(user.reload.email).to eq new_email
    end

    scenario 'user updates password' do
      fill_in 'Password', with: new_password
      fill_in 'Password confirmation', with: new_password
      fill_in 'Current password', with: user.password
      click_button 'Update'
      expect(page).to have_text 'Your account has been updated successfully.'
      click_button 'Log Out'
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: new_password
      click_button 'Sign in'
      expect(page).to have_text 'Signed in successfully.'
    end

    scenario 'user submits invalid update' do
      fill_in 'Email', with: ''
      fill_in 'Current password', with: user.password
      click_button 'Update'

      expect(page).to have_text 'Email can\'t be blank'
    end
  end

  describe 'when user is not signed in' do
    scenario 'user cannot access the edit page' do
      visit edit_user_registration_path(user)
      expect(page).to have_text 'You need to sign in or sign up before continuing.'
    end
  end
end
