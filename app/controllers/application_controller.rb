# frozen_string_literal: true

# The base class for all application controller
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def render_not_found_html
    render file: Rails.public_path.join("404.html"),
           status: :not_found,
           layout: false,
           content_type: "text/html"
  end
end
