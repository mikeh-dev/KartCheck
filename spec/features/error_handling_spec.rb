require 'rails_helper'

RSpec.feature 'Error handling', type: :feature do
  scenario 'visiting a non-existent route shows the custom error page' do
    visit '/non_existent_route'
    expect(page).to have_text('404')
  end
end