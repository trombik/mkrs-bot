# frozen_string_literal: true

# Dashboard for logged-in users
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
