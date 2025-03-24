require "rails_helper"
require "factory_bot"

RSpec.describe "Docs", type: :request do
  context "when user is authenticated" do
    login_user

    describe "GET /doc/index" do
      it "returns http success" do
        get "/doc/index"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /doc/" do
      it "returns http success" do
        get "/doc/"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /doc/telegram/README.md" do
      it "returns http success" do
        get "/doc/telegram/README.md"
        expect(response).to have_http_status(:success)
      end
    end

    context "when resouce is not found" do
      it "returns 404" do
        get "/doc/no_such_file.md"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context "when user is not authenticated" do
    paths = %w[ /doc/index /doc/ ]
    paths.each do |path|
      describe "GET #{path}" do
        it "returns http success" do
          get path
          expect(response).to have_http_status(:redirect)
        end
      end
    end

    paths = %w[ /doc/telegram/README.md /doc/no_such_file.md ]
    paths.each do |path|
      describe "GET #{path}" do
        it "returns http success" do
          get path
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
