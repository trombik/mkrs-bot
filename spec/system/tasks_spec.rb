# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tasks", type: :system do
  let(:user) { create(:user) }
  let(:tasks) { [create(:task, user: user), create(:task)] }
  let(:task) { tasks.first }

  before do
    tasks
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    visit tasks_url
  end

  describe "Navigation" do
    it "has a link to tasks" do
      visit "/"
      within "nav#global_nav_bar" do
        click_on "Tasks"
      end
      expect(page).to have_current_path(tasks_path)
    end
  end

  describe "tasks" do
    it "shows a list of tasks" do
      tasks.each do |task|
        expect(page).to have_content(task.name)
      end
    end

    it "has a link to a task" do
      expect(page).to have_link task.name, href: task_path(task)
    end

    it "has a link to edit a task" do
      expect(page).to have_link "Edit", href: edit_task_path(task)
    end
  end

  describe "Features" do
    let(:new_task_name) { "New task" }
    let(:new_task_description) { "Description of #{new_task_name}" }

    it "create a new task" do
      click_on "Create Task"
      fill_in "Name", with: new_task_name
      fill_in "Description", with: new_task_description
      click_on "Create Task"

      within "div.alert" do
        expect(page).to have_content "successfully"
      end
    end

    it "delete a task" do
      click_on task.name
      click_on "Delete"

      within "div.alert" do
        expect(page).to have_content "successfully"
      end
    end

    it "edit a task" do
      new_name = "New Name"
      click_link "Edit", href: edit_task_path(task)
      fill_in "Name", with: new_name
      click_on "Update Task"

      within "div.alert" do
        expect(page).to have_content("successfully")
      end
      expect(page).to have_content(new_name)
    end

    it "has a form element to assign a new task to StaffUser or StaffGroup" do
      visit new_task_url
      expect(page).to have_css "div#nav-task-assignment"
    end

    it "has a form element to assign an existing task to StaffUser or StaffGroup" do
      visit edit_task_path(task)
      expect(page).to have_css "div#nav-task-assignment"
    end

    it "assigns an existing task to a user" do
      staff_user = create(:staff_user)
      visit edit_task_path(task)
      check staff_user.display_name
      click_on "Update Task"

      expect(page).to have_content("successfully")
      expect(task.staff_users.to_a).to include(staff_user)
    end

    it "assigns an existing task to a group" do
      staff_user = create(:staff_user)
      staff_group = create(:staff_group, staff_users: [staff_user])
      visit edit_task_path(task)
      check staff_group.name
      click_on "Update Task"

      expect(page).to have_content("successfully")
      expect(task.staff_groups).to include(staff_group)
      expect(task.assignees).to include(staff_group)
      expect(task.expanded_assignees.map { |element| element.include?(staff_user) }).to include(true)
    end

    it "removes a group from an existing task" do
      staff_user = create(:staff_user)
      staff_group = create(:staff_group, staff_users: [staff_user])
      task.staff_groups << staff_group
      visit edit_task_path(task)
      uncheck staff_group.name
      click_on "Update Task"

      expect(page).to have_content("successfully")
      expect(task.staff_groups).not_to include(staff_group)
      expect(task.assignees).not_to include(staff_group)
      expect(task.expanded_assignees).not_to include(staff_user)
    end

    it "removes a user from an existing task" do
      staff_user = create(:staff_user)
      task.staff_users << staff_user
      visit edit_task_path(task)
      uncheck staff_user.display_name
      click_on "Update Task"

      expect(page).to have_content("successfully")
      expect(task.staff_users).not_to include(staff_user)
      expect(task.assignees).not_to include(staff_user)
    end
  end
end
