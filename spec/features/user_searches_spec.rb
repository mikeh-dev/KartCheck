require 'rails_helper'

RSpec.feature 'User searches', type: :feature do
    scenario 'user searches for an engine' do
        visit engines_path
        
        expect(page).to have_text 'Search Engines'
        expect(page).to have_button 'Search'

        fill_in 'q', with: 'HY6664'
        click_button 'Search'
        expect(page).to have_text 'Engine Number'
  end
end
