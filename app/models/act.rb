# frozen_string_literal: true

# A class that takes an action in Task
class Act < ApplicationRecord
  include Recurrable
  include RecurrenceBuildable

  validates :active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :starts_at, presence: true

  belongs_to :task
end
