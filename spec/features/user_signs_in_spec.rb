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

  scenario 'with a non-existent email' do
    visit new_user_session_path

    fill_in 'Email', with: 'nonexistent@example.com'
    fill_in 'Password', with: 'randompassword'
    click_button 'Sign in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to_not have_link 'Sign Out'
  end

  scenario 'with an incorrect password' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to_not have_link 'Sign Out'
  end

  scenario 'User gets redirected when trying to access a protected page' do
    visit user_dashboard_path

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end

  scenario 'Signed-in user tries to access the sign-in page' do
    user = create(:user)
    login_as(user, scope: :user)

    visit new_user_session_path

    expect(page).to have_current_path root_path
    expect(page).to have_content 'You are already signed in.'
  end
end
