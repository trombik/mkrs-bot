# frozen_string_literal: true

require "rails_helper"

RSpec.describe "staff_users/new", type: :view do
  before do
    assign(:staff_user, StaffUser.new(
                          name: "MyString",
                          account: "MyString",
                          display_name: "MyString",
                          active: false
                        ))
  end

  # rubocop:disable RSpec/ExampleLength
  it "renders new staff_user form" do
    render

    assert_select "form[action=?][method=?]", staff_users_path, "post" do
      assert_select "input[name=?]", "staff_user[name]"

      assert_select "input[name=?]", "staff_user[account]"

      assert_select "input[name=?]", "staff_user[display_name]"

      assert_select "input[name=?]", "staff_user[active]"
    end
  end
  # rubocop:enable RSpec/ExampleLength
end
