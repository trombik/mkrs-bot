# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act::DetailCardComponent, type: :component do
  let(:task) { create(:task, user: create(:user)) }
  let(:act) { create(:act, task: task) }

  before do
    render_inline(described_class.new(act))
  end

  it "has act name" do
    expect(page).to have_content act.name
  end

  it "has act description" do
    expect(page).to have_content act.description
  end

  it "has link to edit act" do
    expect(page).to have_link("Edit", href: edit_act_path(act))
  end

  it "has link to Delete" do
    expect(page).to have_link("Delete")
  end

  it "has a description of the act_type" do
    expect(page).to have_content act.description_of_act_type[:about]
  end
end
