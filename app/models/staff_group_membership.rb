# frozen_string_literal: true

# An intermediary model that creates a many-to-many relationship between
# StaffGroup and StaffUser.
class StaffGroupMembership < ApplicationRecord
  belongs_to :staff_user
  belongs_to :staff_group
end
