# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "hello#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
