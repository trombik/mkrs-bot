# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Roles management", :js, type: :system do
  let(:user) { create(:user) }
  let(:default_staff_group) do
    group = create(:staff_group)
    group.name = "Default group"
    group.save
    group
  end

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

  context "when managing roles" do
    before do
      default_staff_group
      visit "/"
      click_on "User and Role"
      click_on "Roles"
    end

    scenario "Create a role" do
      name = "Test role"

      click_on "Create Role"
      fill_in "Name", with: name
      click_on "Save"
      expect(page).to have_content name
    end

    scenario "Delete a role" do
      click_on "View"
      click_on "Delete"
      expect(page).to have_content "Deleted #{default_staff_group.name}"
    end
  end
end
