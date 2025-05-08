# frozen_string_literal: true

# A class that represents staff.
class StaffUser < ApplicationRecord
  belongs_to :staff_group

  validates :display_name, presence: true
  validates :account, presence: true
  validates_associated :staff_group
end
