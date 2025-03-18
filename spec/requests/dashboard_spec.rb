require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe "GET /index" do
    context "when user is not authenticated" do
      it "redirects to login form" do
        get "/dashboard/index"
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
