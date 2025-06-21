# frozen_string_literal: true

# A class that takes an action in Task
class Act < ApplicationRecord
  validates :active, inclusion: { in: [true, false] }
  validates :name, presence: true
end
