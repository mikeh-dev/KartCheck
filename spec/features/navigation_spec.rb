require 'rails_helper'

RSpec.feature 'Navigation and Links', type: :feature do
  let(:user) { create(:user) }

  scenario 'User can navigate to the home page' do
    visit root_path
    expect(page).to have_content('Check a Chassis or Engine')
    expect(page).to have_link('Sign In', href: new_user_session_path)
  end

  scenario 'User can navigate to the Dashboard' do
    sign_in(user)
    visit root_path
    click_on 'Account'
    click_link 'Dashboard'
    expect(page).to have_content('Engines')
    expect(page).to have_content('Chassis\'')
    expect(page).to have_link('Search')
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
