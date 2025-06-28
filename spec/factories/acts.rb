# frozen_string_literal: true

FactoryBot.define do
  factory :act do
    name { "Example task" }
    active { false }
    description { "Example description" }
    task { association :task }
  end
end
