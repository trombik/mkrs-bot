# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dropdown::LinkItemComponent, type: :component do
  let(:text) { "Edit" }
  let(:path) { "/edit" }

  before do
    render_inline(described_class.new("Edit", "/edit"))
  end

  it "creates a link" do
    expect(page).to have_css("a[href='#{path}']")
      .and have_content text
  end

  context "when disabled" do
    before do
      render_inline(described_class.new("Disabled", "#"))
    end

    it "has disabled in class" do
      expect(page).to have_css("a.disabled")
        .and have_css("a[aria-disabled='true']")
    end
  end

  context "when enabled" do
    before do
      render_inline(described_class.new("Enabled", "/foo"))
    end

    it "has disabled in class" do
      expect(page).to have_no_css("a.disabled")
        .and have_css("a[aria-disabled='false']")
    end
  end
end
