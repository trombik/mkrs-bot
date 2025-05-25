# frozen_string_literal: true

require "rails_helper"

RSpec.describe "staff_users/edit", type: :view do
  let(:staff_user) do
    StaffUser.create!(
      name: "MyString",
      account: "MyString",
      display_name: "MyString",
      active: false
    )
  end

  before do
    assign(:staff_user, staff_user)
  end

  it "renders the edit staff_user form" do
    render

    assert_select "form[action=?][method=?]", staff_user_path(staff_user), "post" do
      assert_select "input[name=?]", "staff_user[name]"

      assert_select "input[name=?]", "staff_user[account]"

      assert_select "input[name=?]", "staff_user[display_name]"

      assert_select "input[name=?]", "staff_user[active]"
    end
  end
end
