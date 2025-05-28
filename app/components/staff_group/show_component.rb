# frozen_string_literal: true

# A component to show a StaffGroup
class StaffGroup::ShowComponent < ViewComponent::Base
  attr_accessor :staff_group

  def initialize(staff_group)
    @staff_group = staff_group
    super
  end
end
