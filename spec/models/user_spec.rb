require 'rails_helper'

RSpec.describe "User", type: :model do
  let(:user) { build(:user)}

  after(:each) do
    User.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(user.valid?).to be(true)
    expect(user.save).to be(true)
  end

  it 'is invalid with invalid name' do
    user.name = ''
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a too short name' do
    user.name = 'ya'
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'is invalid with a too long name' do
    user.name = 'y' * 21
    expect(user.valid?).to be(false)
    expect(user.save).to be(false)
  end

  it 'has many purchases' do
    expect(user.purchases).to eq([])
  end

  it 'has many groups' do
    expect(user.groups).to eq([])
  end
end