require 'rails_helper'

RSpec.describe "User Views Tracks", type: :feature do

  scenario "User can view all tracks" do
    track = create(:track)
    sign_in create(:user)
    visit root_path
    click_link "Tracks"
    expect(page).to have_content(track.name)
  end

  scenario "User can view a track" do
    track = create(:track)

    sign_in create(:user)
    visit root_path
    click_link "Tracks"
    click_link track.name
    expect(page).to have_content(track.name)
  end
end