# frozen_string_literal: true

# A button wrapped with a <a> tag. Designed for a link button.
class Button::LinkComponent < ViewComponent::Base
  attr_accessor :text, :path

  def initialize(text, path)
    @text = text
    @path = path
    super
  end
end
