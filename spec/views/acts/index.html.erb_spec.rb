# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/index", type: :view do
  before do
    assign(:acts, create_list(:act, 2, task: create(:task, user: create(:user))))
  end

  it "renders a list of acts" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description"), count: 2
  end
end
