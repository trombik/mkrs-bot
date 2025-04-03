# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flash::MessageComponent, type: :component do
  let(:text) { "This is a message" }

  it "renders info flash message" do
    render_inline(described_class.new(type: :notice)) { text }

    expect(page).to have_css "div div", text: text
  end
end
