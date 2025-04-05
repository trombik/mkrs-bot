# frozen_string_literal: true

require "rails_helper"

RSpec.describe Nav::NavbarComponent, type: :component do
  let(:nav_tag) { '<nav class="navbar navbar-expand-lg bg-body-tertiary">' }

  it "renders Navigation bar" do
    expect(render_inline(described_class.new).to_html).to include nav_tag
  end
end
