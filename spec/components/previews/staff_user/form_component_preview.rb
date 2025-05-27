# frozen_string_literal: true

class StaffUser::FormComponentPreview < ViewComponent::Preview
  def default
    render(StaffUser::FormComponent.new(StaffUser.new))
  end
end
