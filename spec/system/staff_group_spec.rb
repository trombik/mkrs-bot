# frozen_string_literal: true

require "rails_helper"

RSpec.feature "StaffGroup management", type: :system do
  let(:user) { create(:user) }
  let(:staff_user) { create(:staff_user, staff_groups: [default_staff_group]) }
  let(:default_staff_group) { create(:staff_group, name: "Default group") }

  before do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
  end

  describe "Navigation" do
    it "has a link to role management" do
      visit "/"
      within("nav#global_nav_bar") do
        click_on "User and Role"
        click_on "Roles"
        expect(page).to have_current_path(staff_groups_path)
      end
    end
  end

  describe "Features" do
    before do
      default_staff_group
      visit "/"
      within("nav#global_nav_bar") do
        click_on "User and Role"
        click_on "Roles"
      end
    end

    it "shows a list of StaffGroup" do
      expect(page).to have_content(default_staff_group.name)
    end

    it "creates new StaffGroup" do
      new_staff_group = "New Staff Group"
      click_on "Create Role"
      fill_in "Name", with: new_staff_group
      click_on "Save"

      expect(page).to have_content "Created #{new_staff_group}"
    end

    describe "StaffGroup page" do
      before do
        staff_user
        visit staff_group_path(default_staff_group)
      end

      it "shows a StaffGroup" do
        expect(page).to have_content default_staff_group.name
      end

      it "shows all the members" do
        within("div.container#staff_group") do
          expect(page).to have_content "Members"
          expect(page).to have_content staff_user.display_name
        end
      end

      it "has links to the members" do
        within("div.container#staff_group") do
          expect(page).to have_link(staff_user.display_name, href: staff_user_path(staff_user))
        end
      end
    end

    describe "StaffGroup edit page" do
      before do
        visit edit_staff_group_path(default_staff_group)
      end

      it "edit StaffGroup" do
        new_name = "New Name"
        fill_in "Name", with: new_name
        click_on "Save"

        expect(page).to have_content "Updated #{new_name}"
      end
    end

    it "destroy StaffGroup" do
      visit staff_group_path(default_staff_group)
      click_on "Delete"

      expect(page).to have_content "Deleted #{default_staff_group.name}"
    end
  end
end
