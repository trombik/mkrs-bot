# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/edit", type: :view do
  let(:act) do
    Act.create!(
      name: "MyString",
      active: false,
      description: "MyString"
    )
  end

  before do
    assign(:act, act)
  end

  # rubocop:disable RSpec/ExampleLength
  it "renders the edit act form" do
    render
    assert_select "form[action=?][method=?]", act_path(act), "post" do
      assert_select "input[name=?]", "act[name]"
      assert_select "input[name=?]", "act[active]"
      assert_select "input[name=?]", "act[description]"
    end
  end
  # rubocop:enable RSpec/ExampleLength
end
