# frozen_string_literal: true

class Button::LinkComponentPreview < ViewComponent::Preview
  def default
    render(Button::LinkComponent.new("Click", "/clicked"))
  end

  def disabled_button
    render(Button::LinkComponent.new("Click", "#", disabled: true))
  end
end
