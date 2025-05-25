# frozen_string_literal: true

require "rails_helper"

RSpec.describe "staff_users/index", type: :view do
  before do
    assign(:staff_users, [
             StaffUser.create!(
               name: "Name",
               account: "Account",
               display_name: "Display Name",
               active: false
             ),
             StaffUser.create!(
               name: "Name",
               account: "Account",
               display_name: "Display Name",
               active: false
             )
           ])
  end

  it "renders a list of staff_users" do
    render
    cell_selector = "td>a"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2

    cell_selector = "td"
    assert_select cell_selector, text: Regexp.new("Account"), count: 2
    assert_select cell_selector, text: Regexp.new("Display Name"), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
