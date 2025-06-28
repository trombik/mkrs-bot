# frozen_string_literal: true

require "rails_helper"

RSpec.describe Button::LinkComponent, type: :component do
  let(:path) { "/path" }
  let(:text) { "Login" }

  before do
    render_inline(described_class.new(text, path))
  end

  it "has a link" do
    expect(page).to have_css "a[href='#{path}']", text: text
  end

  context "when disabled" do
    before do
      render_inline(described_class.new(text, "#", disabled: true))
    end

    it "is disabled" do
      expect(page).to have_css "a.disabled"
    end

    it "has aria-disabled true" do
      expect(page).to have_css "a[aria-disabled='true']"
    end
  end

  context "when enabled" do
    before do
      render_inline(described_class.new(text, "#"))
    end

    it "is NOT disabled" do
      expect(page).to have_no_css "a.disabled"
    end

    it "has aria-disabled false" do
      expect(page).to have_css "a[aria-disabled='false']"
    end
  end
end
