require 'rails_helper'

RSpec.feature 'User signs in' do
  scenario 'with valid credentials' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_button 'Log Out'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials' do
    user = build(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to_not have_link 'Sign Out'
  end

  scenario 'User remains logged in after closing and reopening the browser' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    check 'Remember me' 
    click_button 'Sign in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_button 'Log Out'
    expect(page).to have_current_path root_path

    new_session = Capybara::Session.new(:rack_test, Rails.application)
    new_session.visit root_path

    visit root_path

    expect(page).to have_button 'Log Out'
    expect(page).to have_current_path root_path
  end
end
