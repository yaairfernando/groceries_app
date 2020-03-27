require 'rails_helper'

RSpec.describe 'Purchase', type: :model do
  let(:purchase) { build(:purchase) }
  let(:user) { build(:user) }
  let(:group) { build(:group) }

  before(:each) do
    user.save
    group.creator_id = user.id
    group.save
  end

  after(:each) do
    Purchase.destroy_all
  end

  it 'is valid with valid attributes' do
    purchase.author_id = user.id
    purchase.group_id = group.id
    expect(group.valid?).to be(true)
    expect(group.save).to be(true)
  end

  it 'is invalid with invalid name' do
    purchase.author_id = user.id
    purchase.group_id = group.id
    purchase.name = ''
    expect(purchase.valid?).to be(false)
    expect(purchase.save).to be(false)
  end

  it 'is invalid with invalid amount' do
    purchase.author_id = user.id
    purchase.group_id = group.id
    purchase.amount = ''
    expect(purchase.valid?).to be(false)
    expect(purchase.save).to be(false)
  end

  it 'is invalid with invalid author_id' do
    purchase.author_id = ''
    purchase.group_id = group.id
    expect(purchase.valid?).to be(false)
    expect(purchase.save).to be(false)
  end

  it 'is valid with invalid group_id' do
    purchase.author_id = user.id
    purchase.group_id = ''
    expect(purchase.valid?).to be(true)
    expect(purchase.save).to be(true)
  end

  it 'belong to a creator' do
    purchase.author_id = user.id
    purchase.group_id = group.id
    purchase.save
    expect(purchase.creator).to eq(user)
  end

  it 'belong to a group' do
    purchase.author_id = user.id
    purchase.group_id = group.id
    purchase.save
    expect(purchase.group).to eq(group)
  end
  
end