# frozen_string_literal: true

require 'rails_helper'

feature 'Groups' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
    click_link 'groups'
  end

  scenario 'Visit index' do
    expect(page).to have_content('Groups')
  end

  scenario 'Create a new group' do
    create_group
  end
end

feature 'Groups' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
    click_link 'groups'
  end

  scenario 'Do not create a new group with invalid name' do
    click_link 'Create new Group'
    expect(find('form')).to be_present
    expect(find('#group_icon')).to be_present
    within('form') do
      fill_in 'group_name', with: 'M'
    end
    find('#group_icon').set(Rails.root.join('spec/support/candy.png'))
    click_button 'Create'
    expect(page).to have_content('is too short (minimum is 3 characters')
  end
end

feature 'Groups' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
    click_link 'groups'
  end

  scenario 'Do not create a new group with invalid icon' do
    click_link 'Create new Group'
    expect(find('form')).to be_present
    expect(find('#group_icon')).to be_present
    within('form') do
      fill_in 'group_name', with: 'My new group'
    end
    click_button 'Create'
    expect(find('.btn-blue')).to be_present
  end
end

feature 'Groups Transactions' do
  include Integration
  before(:each) do
    sign_up
    sign_out
    log_in
    click_link 'Dashboard'
    li = find_all('li')
    expect(li.count).to eq(3)
    click_link 'groups'
  end

  scenario 'Visit group transactions' do
    create_group
    find('.group__image').click
    expect(page).to have_content('My new group')
    expect(find('.purchase__create')).to be_present
  end
end
