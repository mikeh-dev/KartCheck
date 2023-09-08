require 'rails_helper'

RSpec.describe 'User Creating, Updating, and Deleting Chassis', type: :feature do

  let(:admin_user) { create(:user, :admin) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user, email: 'user3@example.com' ) }
  let(:chassis) { create(:chassis, user: user2) }

  scenario 'Admin creates a new chassis' do
    sign_in(admin_user)
    visit new_chassis_path
    expect(page).to have_content('Chassis\' Details')
    fill_in 'chassis[make]', with: 'OTK'
    fill_in 'chassis[model]', with: 'Kosmic'
    fill_in 'chassis[number]' , with: 'HY1234'
    fill_in 'chassis[year]', with: '2019'
    fill_in 'chassis[colour]', with: 'Red'
    click_button 'Save'
    expect(page).to have_content('Chassis created successfully.')
  end

  scenario 'User creates a chassis' do
    sign_in(user1)
    visit new_chassis_path
    fill_in 'chassis[make]', with: 'OTK'
    fill_in 'chassis[model]', with: 'Kosmic'
    fill_in 'chassis[number]' , with: 'HY1234'
    fill_in 'chassis[year]', with: '2019'
    fill_in 'chassis[colour]', with: 'Red'
    click_button 'Save'
    expect(page).to have_content('Chassis created successfully.')
  end

  scenario 'User views own chassis' do 
    sign_in user2
    visit chassis_path(chassis)
    expect(page).to have_content('Chassis')
  end

  scenario 'User cannot view another User\'s chassis' do
    sign_in user1
    visit chassis_path(chassis)
    expect(page).to have_content('You are not authorized to view this Chassis.')
  end

  scenario 'User cannot edit another User\'s chassis' do
    sign_in user1
    visit edit_chassis_path(chassis)
    expect(page).to have_content('You are not authorized to view this Chassis.')
  end

  scenario 'User cannot delete another User\'s chassis' do
    sign_in user1
    visit chassis_path(chassis)
    expect(page).to have_content('You are not authorized to view this Chassis.')
    page.driver.submit :delete, chassis_path(chassis), {}
    expect(page).to have_content('You are not authorized to view this Chassis.')
    expect(page).to have_current_path(root_path)
    expect(Chassis.find_by(id: chassis.id)).to eq(chassis)
  end

  scenario 'User can edit their own chassis' do
    sign_in user2
    visit edit_chassis_path(chassis)
    fill_in 'chassis[make]', with: 'OTK'
    click_button 'Save'
    expect(page).to have_content('Chassis updated successfully.')
  end

  scenario 'User cannot delete their own chassis' do
    sign_in user2
    visit chassis_path(chassis)
    expect(page).not_to have_link('Delete')
  end
end