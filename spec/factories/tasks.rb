# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    description { "A task to do something" }
    user { User.first }
  end
end
