# frozen_string_literal: true

RSpec.shared_examples "returning response status for HTTP request" do |path, expected_status, **args|
  verb = args[:verb] || :get
  args.delete :verb

  it "returns #{expected_status} for #{verb.upcase} #{path}" do
    method(verb).call path, **args
    expect(response).to have_http_status(expected_status)
  end
end

RSpec.shared_examples "success response" do |path, **args|
  it_behaves_like "returning response status for HTTP request", path, :success, **args
end

RSpec.shared_examples "unauthorized response" do |path, **args|
  it_behaves_like "returning response status for HTTP request", path, :unauthorized, **args
end

RSpec.shared_examples "not found response" do |path, **args|
  it_behaves_like "returning response status for HTTP request", path, :not_found, **args
end

RSpec.shared_examples "redirect response" do |path, **args|
  it_behaves_like "returning response status for HTTP request", path, :redirect, **args
end

RSpec.shared_examples "authentication is required" do |path, **args|
  context "when user is authnticated" do
    login_user

    it_behaves_like "success response", path, **args
  end

  context "when user is not authnticated" do
    it_behaves_like "redirect response", path, **args
  end
end
