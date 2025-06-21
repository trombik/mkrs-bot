# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/index", type: :view do
  before do
    assign(:acts, [
             Act.create!(
               name: "Name",
               active: false,
               description: "Description"
             ),
             Act.create!(
               name: "Name",
               active: false,
               description: "Description"
             )
           ])
  end

  it "renders a list of acts" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description"), count: 2
  end
end
