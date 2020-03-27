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
    click_link 'All my transactions'
  end

  scenario 'Visit index' do
    expect(page).to have_content('Transactions')
  end

  scenario 'Create a new group' do
    click_link 'Register new Purchase'
    expect(find('form')).to be_present
    # expect(find('#group_icon')).to be_present
    within('form') do
      fill_in 'purchase_name', with: 'Potatoes'
      fill_in 'purchase_amount', with: 15
      fill_in 'purchase_group_id', with: find('#purchase_group_id').first(:option).select_option
    end
    # find('#group_icon').set(Rails.root.join('spec/support/candy.png'))
    click_button 'Create'
    expect(page).to have_content('A new group has been added!!')
  end

end