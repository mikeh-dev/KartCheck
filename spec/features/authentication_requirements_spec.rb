require 'rails_helper'

RSpec.feature 'Authentication Requirements' do
  scenario 'unauthenticated user is redirected to sign-in page' do
    visit new_engine_path

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end

  scenario 'authenticated user can access protected pages' do
    user = create(:user)
    sign_in user

    visit engines_path

    expect(page).to have_current_path engines_path
    expect(page).to have_text 'Engines'
  end
end
