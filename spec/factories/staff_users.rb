# frozen_string_literal: true

FactoryBot.define do
  factory :staff_user do
    display_name { "Example user" }
    account { "@foo" }
    staff_group
  end
end
