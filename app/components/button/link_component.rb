# frozen_string_literal: true

class Button::LinkComponent < ViewComponent::Base
  attr_accessor :text, :path

  def initialize(text, path)
    @text = text
    @path = path
    super
  end
end
