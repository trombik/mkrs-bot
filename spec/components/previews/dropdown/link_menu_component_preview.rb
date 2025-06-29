# frozen_string_literal: true

class Dropdown::LinkMenuComponentPreview < ViewComponent::Preview
  def default
    text = "Actions"
    items = [
      Dropdown::LinkItemComponent.new("Edit", "/edit"),
      Dropdown::LinkItemComponent.new("Delete", "/delete"),
      Dropdown::LinkItemComponent.new("Disabled", "#")
    ]
    id = "foobarbuz"
    render(Dropdown::LinkMenuComponent.new(text, items, id: id))
  end
end
