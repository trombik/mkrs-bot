# frozen_string_literal: true

# A class for tasks theat perorm actions
class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :task_assignments, dependent: :destroy
  has_many :staff_users, through: :task_assignments, source: :assignee, source_type: "StaffUser"
  has_many :staff_groups, through: :task_assignments, source: :assignee, source_type: "StaffGroup"

  def assignees
    task_assignments.map(&:assignee)
  end

  def expanded_assignees
    # expand staff_users
    assignees.map { |assignee| assignee.respond_to?(:staff_users) ? assignee.staff_users : assignee }
             # reject empty groups
             .reject { |element| element == [] }
  end
end
