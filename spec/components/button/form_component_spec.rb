# frozen_string_literal: true

require "rails_helper"

RSpec.describe Button::FormComponent, type: :component do
  let(:path) { "/path" }
  let(:default) do
    render_inline(described_class.new("OK", path))
  end

  it "incudes a button with OK as text" do
    expect(default.to_html).to have_button text: "OK"
  end

  it "has a button with type: submit" do
    expect(default.to_html).to have_button type: "submit"
  end

  it "has a button wrapped with a <form>" do
    expect(default.to_html).to have_css "form button"
  end

  it "has a form with method: post" do
    expect(default.to_html).to have_css "form[method='post']"
  end

  it "has a form with action: to a URL" do
    expect(default.to_html).to have_css "form[action='#{path}']"
  end
end
