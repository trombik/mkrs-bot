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
  end
end
