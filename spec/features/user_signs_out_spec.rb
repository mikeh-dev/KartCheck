require 'rails_helper'

RSpec.feature 'User signs out' do
  scenario 'user signs out successfully and is redirected to the homepage' do
    user = create(:user)
    sign_in user
    visit root_path
    click_button 'Log Out'

    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_no_button 'Log Out'
    expect(page).to have_link 'Sign In'
    expect(page).to have_current_path root_path
  end

  scenario 'after signing out, user can no longer access protected resources' do
    user = create(:user)

    sign_in user
    visit root_path
    click_button 'Log Out'

    visit new_engine_path
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end

end
