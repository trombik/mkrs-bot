# frozen_string_literal: true

# A button wrapped with a <a> tag. Designed for a link button.
#
class Button::LinkComponent < ViewComponent::Base
  attr_accessor :text, :path, :args

  def initialize(text, path, **args)
    @text = text
    @path = path
    @args = args
    super
  end

  private

  def disabled?
    args[:disabled]
  end

  def aria_disabled
    disabled? ? "true" : "false"
  end

  def class_disabled
    disabled? ? "disabled" : ""
  end
end
