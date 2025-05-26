# frozen_string_literal: true

# A class to represent staffs, who is notified, messaged, and managed by the
# application.
class StaffUser < ApplicationRecord
  validates :name, presence: true
  validates :display_name, presence: true
  validates :account, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :active, exclusion: { in: [nil] }
  validates :account, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :account, length: { in: 5..32 }

  has_and_belongs_to_many :staff_groups
end
