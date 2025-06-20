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

  has_many :staff_group_membership, dependent: :delete_all
  has_many :staff_groups, through: :staff_group_membership
  has_many :task_assignments, as: :assignee, dependent: :destroy
  has_many :tasks, through: :task_assignments
end
