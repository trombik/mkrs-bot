# frozen_string_literal: true

class Table::WithActionsComponentPreview < ViewComponent::Preview
  def default
    render(Table::WithActionsComponent.new(title: "Roles", columns: [:name], items: [StaffGroup.first]))
  end
end
