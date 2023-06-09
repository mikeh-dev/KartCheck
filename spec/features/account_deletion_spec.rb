require 'rails_helper'

RSpec.describe 'Account Deletion', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit edit_user_registration_path(user)
  end

  scenario 'user initiates account deletion' do
  
    accept_confirm('Are you sure?') do
      click_button 'Cancel my account'
    end

    expect(page).to have_text('Your account has been deleted.')
  end

  scenario 'user cancels account deletion' do
    dismiss_confirm { click_button 'Cancel my account' }

    expect(page).to have_text 'Your account deletion has been cancelled.'
    expect(User.exists?(user.id)).to be_truthy
  end

  scenario 'user cannot access protected pages after account deletion' do
    click_button 'Cancel my account'

    visit dashboard_path
    expect(page).to have_current_path new_user_session_path
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end

  scenario 'associated data is deleted with the account' do
    create_list(:post, 3, user: user)
    create_list(:comment, 2, user: user)

    click_button 'Cancel my account'

    expect(User.exists?(user.id)).to be_falsey
    expect(Post.where(user_id: user.id)).to be_empty
    expect(Comment.where(user_id: user.id)).to be_empty
  end

  scenario 'account deletion requires current password' do
    fill_in 'Current password', with: 'invalid_password'
    click_button 'Cancel my account'

    expect(page).to have_text 'Current password is invalid'
    expect(User.exists?(user.id)).to be_truthy
  end
end
