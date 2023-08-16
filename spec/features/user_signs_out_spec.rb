require 'rails_helper'

RSpec.feature 'User signs out' do
  scenario 'user signs out succesfully' do
    user = create(:user)
    sign_in user
    visit root_path
    click_button 'Log Out'

    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_no_button 'Sign Out'
    expect(page).to have_current_path root_path
  end

  scenario 'redirected to Homepage after sign-out' do
    user = create(:user)
    sign_in user
    visit root_path

    click_button 'Log Out'
    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_link 'Sign In'
  end

  scenario 'check user is signed out after sign-out' do
    user = create(:user)

    sign_in user
    visit root_path
    click_button 'Log Out'

    visit new_engine_path
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end

  scenario 'session termination after sign-out' do
    user = create(:user)

    sign_in user
    visit root_path
    click_button 'Log Out'

    visit new_engine_path

    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end
