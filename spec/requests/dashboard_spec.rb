# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Dashboard", type: :request do
  it_behaves_like "authentication is required", "/dashboard/index"
end
