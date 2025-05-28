# frozen_string_literal: true

class StaffGroup::ShowComponentPreview < ViewComponent::Preview
  def default
    render(StaffGroup::ShowComponent.new(StaffGroup.first))
  end
end
