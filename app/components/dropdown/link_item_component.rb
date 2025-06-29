# frozen_string_literal: true

# Link items for Dropdown::LinkMenuComponent
class Dropdown::LinkItemComponent < ViewComponent::Base
  attr_reader :text, :path, :attributes

  def initialize(text, path, **attributes)
    @text = text
    @path = path
    @attributes = default_attributes.deep_merge attributes
    super
  end

  private

  def default_attributes
    {
      class: "dropdown-item",
      aria: {},
      data: {}
    }
  end

  def before_render
    @attributes[:aria][:disabled] = disabled? ? "true" : "false"
    @attributes[:class] += disabled? ? " disabled" : ""
  end

  def disabled?
    path == "#"
  end
end
