# frozen_string_literal: true

require "rails_helper"

RSpec.describe "StaffGroups", type: :request do
  context "when user is not authenticated" do
    describe "GET index" do
      it "returns redirect" do
        get staff_groups_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context "when user is authenticated" do
    login_user

    describe "GET /index" do
      it "returns 200" do
        get staff_groups_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
