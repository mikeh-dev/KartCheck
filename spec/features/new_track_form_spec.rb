require 'rails_helper'

RSpec.describe "New Track Form", type: :feature do
    
  scenario "Admin user can fill in the new track form" do
      sign_in create(:user, :admin)
      visit new_track_path

      fill_in "Name", with: "New Track"
      fill_in "Overview", with: "This is a new track"
      fill_in "Website", with: "https://www.newtrack.com"
      fill_in "Length", with: "1536ft"
      fill_in "Address", with: "123 New Track Lane"
      fill_in "Phone", with: "123-456-7890"

      click_button "Submit"

    end


end