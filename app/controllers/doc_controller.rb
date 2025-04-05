# frozen_string_literal: true

# A controller to browse app/doc
class DocController < ApplicationController
  before_action :disable_in_prod, :authenticate_user!

  def index
    @doc = Doc.new
    render :index
  end

  def show
    path = "#{params[:path]}.#{params[:format]}"
    doc = Doc.new

    begin
      @content = doc.show(path)
    rescue StandardError
      render_not_found_html
    end
  end

  private

  def disable_in_prod
    render_not_found_html if Rails.env.production?
  end
end
