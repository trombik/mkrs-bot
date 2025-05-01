# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Roles management", :js, type: :system do
  let(:user) { create(:user) }

  before do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
  end

  scenario "A link to role management exists" do
    visit "/"
    click_on "User and Role"
    click_on "Roles"
    expect(page).to have_content "Roles"
  end
end
