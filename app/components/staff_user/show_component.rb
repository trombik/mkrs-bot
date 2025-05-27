# frozen_string_literal: true

# A component to show a user
class StaffUser::ShowComponent < ViewComponent::Base
  attr_accessor :staff_user

  def initialize(staff_user)
    @staff_user = staff_user
    super
  end
end
