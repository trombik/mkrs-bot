# frozen_string_literal: true

require "rails_helper"

RSpec.describe Nav::NavbarComponent, type: :component do
  it "renders Navigation bar" do
    expect(render_inline(described_class.new).to_html).to include '<nav class="navbar navbar-expand-lg bg-body-tertiary">'
  end
end
