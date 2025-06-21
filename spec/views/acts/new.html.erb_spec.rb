# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/new", type: :view do
  before do
    assign(:act, Act.new(
                   name: "MyString",
                   active: false,
                   description: "MyString"
                 ))
  end

  # rubocop:disable RSpec/ExampleLength
  it "renders new act form" do
    render
    assert_select "form[action=?][method=?]", acts_path, "post" do
      assert_select "input[name=?]", "act[name]"
      assert_select "input[name=?]", "act[active]"
      assert_select "input[name=?]", "act[description]"
    end
  end
  # rubocop:enable RSpec/ExampleLength
end
