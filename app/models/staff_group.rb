# frozen_string_literal: true

# Groups of staff members
class StaffGroup < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 255 }
end
