# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dropdown::LinkMenuComponent, type: :component do
  let(:text) { "Actions" }
  let(:items) do
    [
      Dropdown::LinkItemComponent.new("Edit", "/edit")
    ]
  end
  let(:id) { "myID" }

  before do
    render_inline(described_class.new(text, items, id: id))
  end

  it "creates a dropdown menu with a link item" do
    expect(page).to have_content(text)
      .and have_link("Edit", href: "/edit")
  end

  it "has ID for the menu" do
    expect(page).to have_css("ul[aria-labelledby='#{id}']")
      .and have_css("a##{id}")
  end
end
