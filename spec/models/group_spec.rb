# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Group', type: :model do
  let(:group) { build(:group) }
  let(:user) { create(:user) }

  after(:each) do
    Group.destroy_all
  end

  it 'is valid with valid attributes' do
    group.creator_id = user.id
    expect(group.valid?).to be(true)
    expect(group.save).to be(true)
  end

  it 'is invalid with invalid name' do
    group.creator_id = user.id
    group.name = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with a too short name' do
    group.creator_id = user.id
    group.name = 'ya'
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with a too long name' do
    group.creator_id = user.id
    group.name = 'y' * 16
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with invalid icon' do
    group.creator_id = user.id
    group.icon = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'is invalid with invalid creator_id' do
    group.creator_id = ''
    expect(group.valid?).to be(false)
    expect(group.save).to be(false)
  end

  it 'belong to a user' do
    group.creator_id = user.id
    group.save
    expect(group.creator).to eq(user)
  end

  it 'has many purchases' do
    group.creator_id = user.id
    group.save
    expect(group.purchases).to eq([])
  end
end
