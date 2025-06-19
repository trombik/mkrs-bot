# frozen_string_literal: true

# A class for tasks theat perorm actions
class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
