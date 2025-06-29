# frozen_string_literal: true

class Dropdown::LinkItemComponentPreview < ViewComponent::Preview
  def default
    render(Dropdown::LinkItemComponent.new("Edit", "/edit"))
  end

  def disabled
    render(Dropdown::LinkItemComponent.new("Disabled", "#"))
  end
end
