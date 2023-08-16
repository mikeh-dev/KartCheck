require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario "User sees sign in link" do
    visit root_path
    expect(page).to have_link 'Sign In'
  end

  scenario "User sees performs a search" do
    visit root_path
    fill_in "q", with: 'HYTEST'
    click_button "Search"
    expect(page).to have_content "Sorry,"
  end

  scenario "User sees sign up link after searching" do
    visit root_path
    fill_in "q", with: 'HYTEST'
    click_button "Search"
    expect(page).to have_content "Sorry,"
    expect(page).to have_link 'Register today'
  end

end