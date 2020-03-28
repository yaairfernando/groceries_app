# frozen_string_literal: true

require 'rails_helper'

feature 'Purchases' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
  end

  scenario 'Create a new transaction' do
    click_link 'All groups'
    create_group
    first('.menu__icon > a').click
    click_link 'All my transactions'
    click_link 'Register new Purchase'
    expect(find('form')).to be_present
    within('form') do
      fill_in 'purchase_name', with: 'Potatoes'
      fill_in 'purchase_amount', with: 15
    end
    find('select > option:nth-child(2)').select_option
    click_button 'Create'
    expect(find('.purchase__image > img')).to be_present
    expect(page).to have_content('Your transaction has been added!!')
  end
end

feature 'Purchases' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
  end

  scenario 'Create a new purchase without adding a group' do
    click_link 'All groups'
    create_group
    first('.menu__icon > a').click
    click_link 'All my transactions'
    click_link 'Register new Purchase'
    expect(find('form')).to be_present
    within('form') do
      fill_in 'purchase_name', with: 'Potatoes'
      fill_in 'purchase_amount', with: 15
    end
    click_button 'Create'
    expect(page).to have_content('Your transaction has been added!!')
  end
end

feature 'Purchases' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
  end

  scenario 'Visit index' do
    click_link 'All my transactions'
    expect(page).to have_content('Transactions')
  end

  scenario 'Renders the new template again' do
    click_link 'All my transactions'
    click_link 'Register new Purchase'
    expect(find('form')).to be_present
    within('form') do
      fill_in 'purchase_name', with: ''
      fill_in 'purchase_amount', with: 15
    end
    click_button 'Create'
    expect(page).to have_content("can't be blank")
  end
end
