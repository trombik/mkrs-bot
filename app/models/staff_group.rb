# frozen_string_literal: true

# Groups of staff members
class StaffGroup < ApplicationRecord
  attribute :active, :boolean, default: true

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 255 }

  has_many :staff_group_membership, dependent: :delete_all
  has_many :staff_users, through: :staff_group_membership
  has_many :task_assignments, as: :assignee, dependent: :destroy
  has_many :tasks, through: :task_assignments
end
