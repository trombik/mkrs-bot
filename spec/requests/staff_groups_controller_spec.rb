# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffGroupsController, type: :request do
  it_behaves_like "authentication is required", Rails.application.routes.url_helpers.staff_groups_path
end
