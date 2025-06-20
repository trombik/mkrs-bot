# frozen_string_literal: true

# a class that associates tasks with StaffGroup and StaffUser
class TaskAssignment < ApplicationRecord
  validates :task_id, uniqueness: { scope: [:assignee_id, :assignee_type] }

  belongs_to :task
  belongs_to :assignee, polymorphic: true
end
