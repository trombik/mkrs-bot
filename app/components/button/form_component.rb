# frozen_string_literal: true

class Button::FormComponent < ViewComponent::Base
  attr_accessor :method, :text, :path

  def initialize(text, path, method = "post")
    @text = text
    @path = path
    @method = method
    super
  end
end
