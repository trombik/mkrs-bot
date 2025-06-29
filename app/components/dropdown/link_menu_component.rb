# frozen_string_literal: true

# Dropdown menu with links
class Dropdown::LinkMenuComponent < ViewComponent::Base
  attr_reader :text, :items, :attributes

  def initialize(text, items, attributes)
    @items = items
    @text = text
    @attributes = default_attributes.deep_merge(attributes)
    super
  end

  private

  # rubocop:disable Metrics/MethodLength
  def default_attributes
    {
      aria: {
        expanded: false
      },
      class: "btn btn-default dropdown-toggle btn-secondary",
      data: {
        bs_toggle: "dropdown"
      },
      href: "#",
      role: "button",
      id: "dropdown"
    }
  end
  # rubocop:enable Metrics/MethodLength

  def aria_labelledby
    attributes[:id]
  end
end
