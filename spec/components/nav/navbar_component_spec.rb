# frozen_string_literal: true

require "rails_helper"

RSpec.describe Nav::NavbarComponent, type: :component do
  it "renders Navigation bar" do
    expect(render_inline(described_class.new)).to have_css("nav#global_nav_bar")
  end
end
