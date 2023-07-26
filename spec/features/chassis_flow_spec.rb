require 'rails_helper'

RSpec.describe 'User Creating, Updating, and Deleting Chassis', type: :feature do
  all_users = User.all
  let(:admin_user) { create(:user, :admin) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user, email: 'user3@example.com' ) }
  let(:chassis) { create(:chassis, user: user2) }

  scenario 'Admin creates a new chassis' do
    sign_in(admin_user)
    visit new_chassis_path
    fill_in 'Make', with: 'OTK'
    fill_in 'Model', with: 'Kosmic'
    fill_in 'Number', with: 'HY1234'
    fill_in 'Year', with: '2019'
    fill_in 'Colour', with: 'Red'
    click_button 'Create Chassis'
    expect(page).to have_content('Chassis was successfully created.')
  end

  scenario 'User creates a chassis' do
    sign_in(user1)
    visit new_chassis_path
    fill_in 'Make', with: 'OTK'
    fill_in 'Model', with: 'Kosmic'
    fill_in 'Number', with: 'HY1234'
    fill_in 'Year', with: '2019'
    fill_in 'Colour', with: 'Red'

    click_button 'Create Chassis'
    expect(page).to have_content('Chassis was successfully created.')
  end

  scenario 'User views own chassis' do 
    sign_in user2
    visit chassis_path(chassis)
    expect(page).to have_content('Chassis')
  end

  scenario 'User cannot view another User\'s chassis' do
    sign_in user1
    visit chassis_path(chassis)
    expect(page).to have_content('You are not authorized to view this page.')
  end
end