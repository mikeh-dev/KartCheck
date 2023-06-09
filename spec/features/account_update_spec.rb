require 'rails_helper'

RSpec.describe 'Account Update', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit edit_user_registration_path(user)
  end

  scenario 'user updates email address' do
    fill_in 'Email', with: 'new_email@example.com'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_text 'Your account has been updated successfully.'
  end

  scenario 'user updates password' do
    fill_in 'Password', with: 'new_password'
    fill_in 'Password confirmation', with: 'new_password'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_text 'Your account has been updated successfully.'
  end
end
