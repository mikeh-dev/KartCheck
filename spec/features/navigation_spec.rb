require 'rails_helper'

RSpec.feature 'Navigation and Links', type: :feature do
  let(:user) { create(:user) }

  scenario 'User can navigate to the home page' do
    visit root_path

    expect(page).to have_content('Buying a New Chassis')
    expect(page).to have_link('Sign In', href: new_user_session_path)
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
  end

  scenario 'User can navigate to the engines index page' do
    sign_in(user)
    visit engines_path

    expect(page).to have_content('Engines')
    expect(page).to have_link('Search', href: engines_path)
  end

  scenario 'User can navigate to their account settings page when logged in' do
    sign_in(user)
    visit root_path
    expect(page).to have_content('Account')
    click_on 'Account'
    click_on 'Edit Profile'
    expect(page).to have_content('Edit account')
  end

  scenario 'User can\'t see account settings page if not logged in' do
    visit root_path
    expect(page).not_to have_content('Account')
  end

  scenario 'User can navigate to the About page' do
    visit root_path
    click_link 'About'
    expect(page).to have_content('About')
  end

  scenario 'User can navigate to the Contact page' do
    visit root_path
    click_link 'Contact'
    expect(page).to have_content('Contact')
  end


end
