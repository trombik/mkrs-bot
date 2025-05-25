# frozen_string_literal: true

require "rails_helper"

RSpec.describe "staff_users/show", type: :view do
  before do
    assign(:staff_user, StaffUser.create!(
                          name: "Name",
                          account: "Account",
                          display_name: "Display Name",
                          active: false
                        ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Account/)
    expect(rendered).to match(/Display Name/)
    expect(rendered).to match(/false/)
  end
end
