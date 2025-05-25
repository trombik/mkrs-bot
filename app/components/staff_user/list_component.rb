# frozen_string_literal: true

# A ViewComponent to list StaffUser in a table
class StaffUser::ListComponent < ViewComponent::Base
  def initialize(staff_users)
    @staff_users = staff_users
    super()
  end
end
