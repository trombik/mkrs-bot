# frozen_string_literal: true

# Groups of staff members
class StaffGroup < ApplicationRecord
  attribute :active, :boolean, default: true

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  has_and_belongs_to_many :staff_users
end
