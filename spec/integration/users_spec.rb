# frozen_string_literal: true

require 'rails_helper'

feature 'User' do
  context 'SIGN UP' do
    before(:each) do
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'Yair'
      end
    end

    scenario 'with valid name' do
      click_button 'Sign Up'
      expect(page).to have_content('Dashboard')
    end

    scenario 'with blank name' do
      fill_in 'Username', with: ''
      click_button 'Sign Up'
      expect(page).to have_content("can't be blank")
    end
  end
end

feature 'User' do
  context 'LOG IN' do
    before(:each) do
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'Yair'
      end
      click_button 'Sign Up'
      click_link 'Dashboard'
      click_link 'Sign Out'
      visit login_path
    end

    scenario 'with valid username' do
      within('form') do
        fill_in 'Username', with: 'Yair'
      end
      click_button 'Log In'
      expect(page).to have_content('Dashboard')
    end

    scenario 'with invalid username' do
      within('form') do
        fill_in 'Username', with: 'John'
      end
      click_button 'Log In'
      expect(page).to have_content('Please check your username')
    end
  end
end
