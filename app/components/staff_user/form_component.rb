# frozen_string_literal: true

# A form to edit StaffUser
class StaffUser::FormComponent < ViewComponent::Base
  attr_accessor :staff_user

  def initialize(staff_user)
    @staff_user = staff_user
    super
  end
end
