# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  let(:staff_group_default) { create(:staff_group, name: "Default") }
  let(:staff_user) { create(:staff_user, staff_groups: [staff_group_default]) }

  before do
    staff_user

    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    visit "/staff_users"
  end

  describe "Viewing users" do
    it "lists existing users" do
      expect(page).to have_content staff_user.display_name
    end

    it "has a link on the existing user's display_name" do
      expect(page).to have_link staff_user.display_name
    end
  end

  describe "Viewing a user" do
    before do
      click_on staff_user.display_name
    end

    it "shows a user" do
      expect(page).to have_content(staff_user.display_name).and have_content(staff_user.account)
    end

    it "shows all the groups the user belongs to" do
      expect(page).to have_content(staff_group_default.name)
    end
  end

  describe "Creating users" do
    before do
      visit new_staff_user_path
    end

    let(:new_user) { create(:staff_user) }

    it "creates a new user" do
      fill_in "Name", with: new_user.name
      fill_in "Account", with: new_user.account
      fill_in "Display name", with: new_user.display_name
      click_on "Create Staff user"

      expect(page).to have_content I18n.t("staff_user.create.staff_user_successfully_created.content")
    end
  end

  describe "Deleting users" do
    let(:user_to_delete) { create(:staff_user) }

    before do
      visit staff_user_path(user_to_delete.id)
    end

    it "deletes a user" do
      click_on "Destroy this staff user"

      expect(page).to have_content I18n.t("staff_user.destroy.staff_user_successfully_destroyed.content")
    end
  end

  # rubocop:disable RSpec/MultipleMemoizedHelpers
  describe "Editing users" do
    let(:user_to_edit) { create(:staff_user) }
    let(:group_for_spec) { create(:staff_group) }
    let(:success_message) { I18n.t("staff_user.update.staff_user_successfully_updated.content") }
    let(:new_name) { "New name" }
    let(:new_account) { "new_account" }
    let(:new_display_name) { "New Display Name" }
    let(:submit_button_name) { "Update Staff user" }
    # rubocop:enable RSpec/MultipleMemoizedHelpers

    before do
      group_for_spec
      visit edit_staff_user_path(user_to_edit.id)
    end

    it "updates name" do
      fill_in "Name", with: new_name
      click_on submit_button_name

      expect(page).to have_content success_message
    end

    it "updates display name" do
      fill_in "Display name", with: new_display_name
      click_on submit_button_name

      expect(page).to have_content success_message
    end

    it "updates account" do
      fill_in "Account", with: new_account
      click_on submit_button_name

      expect(page).to have_content success_message
    end

    # rubocop:disable RSpec/MultipleExpectations
    it "adds a user to a group" do
      check(group_for_spec.name)
      click_on submit_button_name

      expect(page).to have_content success_message
      expect(user_to_edit.reload.staff_groups.map(&:id)).to include(group_for_spec.id)
    end
    # rubocop:enable RSpec/MultipleExpectations

    # rubocop:disable RSpec/MultipleExpectations
    it "removes a user from a group" do
      check(group_for_spec.name)
      click_on submit_button_name
      visit edit_staff_user_path(user_to_edit)
      uncheck(group_for_spec.name)
      click_on submit_button_name

      expect(page).to have_content success_message
      expect(user_to_edit.reload.staff_groups.map(&:id)).not_to include(group_for_spec.id)
    end
    # rubocop:enable RSpec/MultipleExpectations

    # rubocop:disable RSpec/MultipleExpectations
    it "deactivate a user" do
      uncheck("Active")
      click_on submit_button_name

      expect(page).to have_content success_message
      expect(user_to_edit.reload.active?).to be false
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
