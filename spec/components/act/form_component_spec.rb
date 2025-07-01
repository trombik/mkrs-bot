# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act::FormComponent, type: :component do
  let(:now) { Time.current }
  let(:act) do
    act = create(:act,
                 starts_at: now,
                 task: create(:task,
                              user: create(:user)))
    act.recurring_type = "daily"
    act.save!
    act
  end

  before do
    render_inline described_class.new(act, act.task.id)
  end

  it "has Name field" do
    expect(page).to have_field("Name", with: act.name)
  end

  it "has Description field" do
    expect(page).to have_field("Description", with: act.description)
  end

  it "has POST method to action /acts" do
    expect(page).to have_css("form[action='/acts'][method='post']")
  end

  it "has recurring_type daily checked" do
    expect(page).to have_css("input[value='daily'][checked]")
  end

  it "has starts_at now" do
    expect(page).to have_css("input[value='#{now.strftime("%FT%H:%M:%S")}']")
  end
end
