# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flash::MessageComponent, type: :component do
  let(:text) { "This is a message" }

  it "renders info flash message" do
    render_inline(described_class.new(type: :notice)) { text }

    expect(page).to have_css "div", text: text
  end

  context "when dismissible is true" do
    it "renders a button to dismiss" do
      render_inline(described_class.new(type: :notice, dismissible: true)) { text }

      expect(page).to have_button
    end
  end

  context "when dismissible is false" do
    it "renders a button to dismiss" do
      render_inline(described_class.new(type: :notice, dismissible: false)) { text }

      expect(page).not_to have_button
    end
  end
end
