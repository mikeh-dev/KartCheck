require 'rails_helper'

RSpec.feature "User's creating, updating, deleting and viewing Engines" do
  let(:admin_user) { create(:user, :admin) }
  let(:user1) { create(:user, email: 'user1@example.com') }
  let(:user) { create(:user, email: 'user2@example.com') }
  let(:engine) { create(:engine, user: user) }

  context 'As an Admin' do
    scenario 'Admin creates a new engine for itself' do
      sign_in(admin_user)
      visit new_engine_path
      fill_in 'Make', with: 'OTK'
      fill_in 'Model', with: 'Kosmic'
      fill_in 'Engine Number', with: 'HY1234'
      click_button 'Save'
      expect(page).to have_content('Engine created successfully.')
    end

    scenario 'Admin updates an engine' do
      sign_in(admin_user)
      engine = create(:engine, user: admin_user)
      visit edit_engine_path(engine)
      fill_in 'Model', with: 'Updated Model'
      click_button 'Save'
      expect(page).to have_content('Engine updated successfully.')
      expect(engine.reload.model).to eq('Updated Model')
    end

    scenario 'Admin deletes an engine' do
      sign_in(admin_user)
      engine = create(:engine, user: admin_user)
      visit user_dashboard_path(admin_user)
      visit edit_engine_path(engine)
      click_link 'Delete'
      expect(page).to have_content('Engine deleted successfully.')
    end
  end

  context 'As a User' do
    scenario 'User creates an Engine for itself' do
      sign_in(user1)
      visit new_engine_path
      fill_in 'Make', with: 'OTK'
      fill_in 'Model', with: 'Kosmic'
      fill_in 'Engine Number', with: 'HY1234'
      click_button 'Save'
      expect(page).to have_content('Engine created successfully.')
      engine = Engine.last
      expect(engine.user_id).to eq(user1.id)
    end

    scenario 'User updates own engine' do
      sign_in(user1)
      engine = create(:engine, user: user1)
      visit edit_engine_path(engine)
      fill_in 'Model', with: 'Updated Model'
      click_button 'Save'
      expect(page).to have_content('Engine updated successfully.')
      expect(engine.reload.model).to eq('Updated Model')
    end

    scenario 'User cannot update another user\'s engine' do
      sign_in(user1)
      engine = create(:engine, user: user)
      visit edit_engine_path(engine)
      expect(page).to have_content('You are not authorized to view this page.')
    end

    scenario 'User cannot delete another user\'s engine' do
      sign_in(user1)
      engine = create(:engine, user: user)
      visit engine_path(engine)
      expect(page).not_to have_button('Delete')
    end

    scenario 'User views own Engine' do
      sign_in(user)
      visit engine_path(engine)
      expect(page).to have_content('Engine Details')
    end

    scenario 'User cannot view another User\'s Engine' do
      sign_in(user1)
      engine = create(:engine, user: user1)
      sign_out(user1)
      sign_in(user)
      visit engine_path(engine)
      expect(page).to have_content('You are not authorized to view this page.')
    end
  end
end
