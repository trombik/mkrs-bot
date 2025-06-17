# frozen_string_literal: true

require "rails_helper"
require "factory_bot"

RSpec.describe "Docs", type: :request do
  it_behaves_like "authentication is required", "/doc/index"

  context "when user is authenticated" do
    login_user

    it_behaves_like "success response", "/doc/index"
    it_behaves_like "success response", "/doc/"
    it_behaves_like "success response", "/doc/telegram/README.md"

    context "when resouce is not found" do
      it_behaves_like "not found response", "/doc/no_such_file.md"
    end
  end

  context "when user is not authenticated" do
    paths = %w[/doc/index /doc/]
    paths.each do |path|
      it_behaves_like "redirect response", path
    end

    paths = %w[/doc/telegram/README.md /doc/no_such_file.md]
    paths.each do |path|
      it_behaves_like "unauthorized response", path
    end
  end
end
