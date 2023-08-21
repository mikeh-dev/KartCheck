require 'rails_helper'

RSpec.describe 'Account Deletion', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit edit_user_registration_path
  end

  scenario 'user initiates account deletion' do
    click_button 'Cancel my account'
    expect(page).to have_text('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end

  scenario 'user cancels account deletion', js: true do
    click_button 'Cancel my account'
    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_text('Edit account')
  end

  scenario 'user cannot access protected pages after account deletion' do
    click_button 'Cancel my account'
    visit edit_user_registration_path
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_text('You need to sign in or sign up before continuing.')
  end
end
