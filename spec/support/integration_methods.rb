# frozen_string_literal: true

module Integration
  def log_in
    visit login_path
    within('form') do
      fill_in 'Username', with: 'Yair'
    end
    click_button 'Log In'
  end

  def sign_up
    visit signup_path
    within('form') do
      fill_in 'Username', with: 'Yair'
    end
    first(:button, 'Sign Up').click
    # click_button 'Sign Up'
  end

  def sign_out
    click_link 'Dashboard'
    # click_link 'Sign Out'
    first(:link, 'Sign Out').click
  end

  def create_group
    first(:link, 'Create new Group').click
    expect(find('form')).to be_present
    expect(find('#group_icon')).to be_present
    within('form') do
      fill_in 'group_name', with: 'My new group'
    end
    find('#group_icon').set(Rails.root.join('spec/support/candy.png'))
    click_button 'Create'
    expect(page).to have_content('A new group has been added!!')
    expect(find('.group__image img')).to be_present
  end

  def create_transaction
    click_link 'Register new Purchase'
    expect(find('form')).to be_present
    expect(find('#group_icon')).to be_present
    within('form') do
      fill_in 'group_name', with: 'My new group'
    end
    find('#group_icon').set(Rails.root.join('spec/support/candy.png'))
    click_button 'Create'
    expect(page).to have_content('A new group has been added!!')
  end
end
