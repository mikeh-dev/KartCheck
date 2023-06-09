require 'rails_helper'

RSpec.feature "User's creating and viewing Engines" do
  let(:admin_user) { create(:user, :admin) }
  let(:user) { create(:user) }
  let(:engine) { create(:engine) }

  scenario 'Admin creates a new engine' do
    sign_in(admin_user)
    visit new_engine_path
    fill_in 'Make', with: 'OTK'
    fill_in 'Model', with: 'Kosmic'
    fill_in 'Engine Number', with: 'HY1234'
    click_button 'Submit'
    expect(page).to have_content('Engine created successfully.')
  end

  scenario 'User creates and Engine and is redirected to their Dashboard' do
    sign_in(user)
    visit new_engine_path
    fill_in 'Make', with: 'OTK'
    fill_in 'Model', with: 'Kosmic'
    fill_in 'Engine Number', with: 'HY1234'
    click_button 'Submit'
    expect(page).to have_content('Dashboard')
  end
end