# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffUser::FormComponent, type: :component do
  let(:new_user) { build(:staff_user) }

  # rubocop:disable RSpec/ExampleLength
  it "renders a form to create or edit a user" do
    render_preview(:default)

    expect(page).to have_css("form[method='post']").and \
      have_field(name: "staff_user[name]").and \
        have_field(name: "staff_user[display_name]").and \
          have_field(name: "staff_user[account]").and \
            have_field(name: "staff_user[active]")
  end
  # rubocop:enable RSpec/ExampleLength
end
