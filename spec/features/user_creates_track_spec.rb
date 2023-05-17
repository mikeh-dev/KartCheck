require 'rails_helper'

RSpec.feature 'Creating a Track' do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create(:user) }

  scenario 'Admin creates a new track' do
    sign_in(admin_user)
    visit new_track_path
    fill_in 'Name', with: 'New Track'
    fill_in 'Overview', with: 'New Track Description'
    click_button 'Submit'
    expect(page).to have_content('Track created successfully.')
  end

  scenario 'User fails to create a new track as not an admin' do
    sign_in(user)
    visit new_track_path
    expect(page).to have_content("You are not authorized to perform this action.")
  end
end
