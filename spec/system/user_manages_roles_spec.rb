# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Roles management", type: :system do
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
      click_on default_staff_group.name
      click_on "Delete"

      expect(page).to have_content "Deleted #{default_staff_group.name}"
    end

    scenario "Edit a role" do
      new_name = "New Name"
      click_on "Edit"
      fill_in "Name", with: new_name
      click_on "Save"

      expect(page).to have_content "Updated #{new_name}"
    end

    scenario "Show a role" do
      click_on default_staff_group.name

      expect(page).to have_current_path staff_group_path(default_staff_group)
    end
  end
end
