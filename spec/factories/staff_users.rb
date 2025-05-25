# frozen_string_literal: true

FactoryBot.define do
  factory :staff_user do
    name { "Given Family" }
    account { "foo12345" }
    display_name { "Nickname" }
    active { true }
  end
end
