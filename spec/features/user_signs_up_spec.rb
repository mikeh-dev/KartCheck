require 'rails_helper'

RSpec.feature 'User sign-up' do
  scenario 'User signs up successfully with valid data' do
    visit new_user_registration_path

    fill_in 'Email', with: 'username@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_button 'Log Out'
    expect(page).to have_current_path root_path
  end

  scenario 'User cannot sign up with invalid data' do
    visit new_user_registration_path

    click_on 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_no_link 'Sign Out'
  end

  scenario 'User unsuccessfully signs up with an existing email' do
    existing_user = FactoryBot.create(:user, email: 'existing@example.com')

    visit new_user_registration_path

    fill_in 'Email', with: existing_user.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content 'Email has already been taken'
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  scenario 'User unsuccessfully signs up with a password which is too short' do
    visit new_user_registration_path

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'short'
    fill_in 'Password confirmation', with: 'short'
    click_on 'Sign up'

    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  scenario 'User unsuccessfully signs up without adding a password in the password confirmation field' do
    visit new_user_registration_path

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  
  scenario 'User unsuccessfully signs up when passwords do not match' do
    visit new_user_registration_path

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password2'
    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  scenario 'User unsuccessfully signs up with an invalid email format' do
    visit new_user_registration_path

    fill_in 'Email', with: 'invalidemailformat'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content 'Email is invalid'
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  scenario 'User signs up with a password and omits the confirmation entirely' do
    visit new_user_registration_path

    fill_in 'Email', with: 'new_user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to_not have_button 'Log Out'
    expect(page).to_not have_current_path root_path
  end

  scenario 'Signed-in user tries to access the sign-up page' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user) # Using the Warden helper for Devise

    visit new_user_registration_path

    expect(page).to have_current_path root_path
    expect(page).to have_content 'You are already signed in.'
  end
  
end
