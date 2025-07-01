# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Acts", type: :system do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:now) { Time.zone.now.beginning_of_hour.beginning_of_minute }

  before do
    visit "/"
    click_on "Sign in"
    fill_in "Password", with: user.password
    fill_in "Email", with: user.email
    click_on "Log in"
    visit edit_task_path(task)
  end

  describe "Adding an act" do
    before do
      click_on "Create new Act"
      within("div#act_form_component") do
        fill_in "Name", with: "New act"
        fill_in "Starts at", with: now.strftime("%FT%H:%M")
        choose "Daily"
      end
    end

    context "when params are valid" do
      it "creates an act" do
        click_on "Create Act"
        act = Act.first

        expect(act.starts_at.rfc3339).to eq now.rfc3339
      end

      it "changes Act on count by one" do
        expect do
          click_on "Create Act"
        end.to change(Act, :count).by(1)
      end

      it "creates a daily act" do
        n_day = 365
        end_time = n_day.days.from_now - 1.hour
        click_on "Create Act"

        expect(Act.first.schedule.occurrences(end_time).count).to eq n_day
      end

      it "creates a weekly act" do
        within("div#act_form_component") do
          choose "Weekly"
          click_on "Create Act"
        end
        n_day = 14
        end_time = n_day.days.from_now - 1.hour

        expect(Act.first.schedule.occurrences(end_time).count).to eq n_day / 7
      end

      it "creates a monthly act" do
        within("div#act_form_component") do
          choose "Monthly"
          click_on "Create Act"
        end
        n_day = 30
        end_time = n_day.days.from_now

        expect(Act.first.schedule.occurrences(end_time).count).to eq n_day / 30
      end
    end
  end
end
