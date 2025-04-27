# frozen_string_literal: true

# A button wrapped with a <form> tag. Designed for simple actions to send
# non-GET HTTP request to a controller, such as "log out" to delete user
# sessions.
class Button::FormComponent < ViewComponent::Base
  attr_accessor :method, :text, :path

  def initialize(text, path, method = "post")
    @text = text
    @path = path
    @method = method
    super
  end
end
