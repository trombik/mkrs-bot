# frozen_string_literal: true

# a base class for contollers that requires authentication
class ProtectedController < ApplicationController
  before_action :authenticate_user!
end
