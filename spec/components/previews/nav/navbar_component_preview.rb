# frozen_string_literal: true

class Nav::NavbarComponentPreview < ViewComponent::Preview
  def default
    render(Nav::NavbarComponent.new)
  end
end
