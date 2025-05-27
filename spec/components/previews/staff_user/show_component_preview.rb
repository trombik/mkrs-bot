# frozen_string_literal: true

class StaffUser::ShowComponentPreview < ViewComponent::Preview
  def default
    user = StaffUser.new(name: "Full Name", display_name: "Display Name", account: "foo123456", active: true)
    render(StaffUser::ShowComponent.new(user))
  end
end
