# frozen_string_literal: true

class Button::FormComponentPreview < ViewComponent::Preview
  def default
    render(Button::FormComponent.new("OK", "/path", "delete"))
  end
end
