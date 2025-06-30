# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Acts", type: :system do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    visit edit_task_path(task)
  end

  describe "Adding an act" do
    it "changes Act on count by one" do
      click_on "Create new Act"

      expect do
        within("div#act_form_component") do
          fill_in "Name", with: "New act"
          fill_in "Starts at", with: "10:00"
        end
        click_on "Create Act"
      end.to change(Act, :count).by(1)
    end
  end
end
