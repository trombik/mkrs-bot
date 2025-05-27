# frozen_string_literal: true

FactoryBot.define do
  factory :staff_group_membership do
    staff_user { nil }
    staff_group { nil }
  end
end
