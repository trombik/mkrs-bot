# frozen_string_literal: true

FactoryBot.define do
  factory :staff_group do
    sequence(:name) { |n| "Group #{n}" }
  end
end
