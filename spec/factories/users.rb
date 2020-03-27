# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Yair' }
  end

  factory :random_user, class: User do
    name { Faker::Name.name }
  end
end
