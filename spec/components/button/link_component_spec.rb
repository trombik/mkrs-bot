# frozen_string_literal: true

require "rails_helper"

RSpec.describe Button::LinkComponent, type: :component do
  let(:path) { "/path" }
  let(:text) { "Login" }
  let(:default) { render_inline(described_class.new(text, path)) }

  it "has a link" do
    expect(default.to_html).to have_css "a[href='#{path}']", text: text
  end
end
