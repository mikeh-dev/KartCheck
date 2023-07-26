require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario "User sees sign in and sign up links" do
    visit root_path
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
  end

  scenario "User sees perform a search link" do
    visit root_path
    expect(page).to have_link 'Search'
    click_link 'Search'
    expect(page).to have_content 'Search Engines'
  end
end