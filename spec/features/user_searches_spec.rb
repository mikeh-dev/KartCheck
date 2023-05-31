require 'rails_helper'

RSpec.feature 'User searches', type: :feature do
    scenario 'user searches for an engine' do
        visit root_path
        
        expect(page).to have_text 'Search'
        expect(page).to have_text 'Engine Number'
        expect(page).to have_button 'Search'
  end
end
