# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/show", type: :view do
  let(:act) { create(:act, task: create(:task, user: create(:user))) }

  before do
    assign(:act, act)
    render
  end

  it "renders card for act" do
    expect(rendered).to have_css("div#card_#{dom_id(act)}")
  end

  it "has link to acts" do
    expect(rendered).to have_link href: acts_path
  end

  it "has link to edit acts" do
    expect(rendered).to have_link href: edit_act_path(act)
  end

  it "has a button to destroy the act" do
    expect(rendered).to have_selector :link_or_button, "Destroy this act"
  end
end
