# frozen_string_literal: true

class StaffUser::ListComponentPreview < ViewComponent::Preview
  def default
    render(StaffUser::ListComponent.new(StaffUser.all))
  end
end
