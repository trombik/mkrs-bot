# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act::FormComponent, type: :component do
  let(:act) { create(:act, task: create(:task, user: create(:user))) }

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
end
