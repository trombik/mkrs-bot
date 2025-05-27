# frozen_string_literal: true

FactoryBot.define do
  factory :staff_user do
    sequence(:name) { |n| "Given Family #{n}" }
    sequence(:account) { |n| "foo12345_#{n}" }
    sequence(:display_name) { |n| "Nickname #{n}" }
    active { true }
  end
end
