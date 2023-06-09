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
end
