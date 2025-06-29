# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act::ButtonComponent, type: :component do
  let(:act) { create(:act, task: create(:task, user: create(:user))) }

  before do
    render_inline described_class.new(act)
  end

  it "has name of act" do
    expect(page).to have_content(act.name)
  end

  it "has link to the act" do
    expect(page).to have_link act.name, href: act_path(act)
  end

  context "when the recoed is a new record" do
    let(:act) { build(:act, task: create(:task, user: create(:user))) }

    it "is disabled" do
      expect(page).to have_css("a.disabled")
    end

    it "has a link to #" do
      expect(page).to have_link act.name, href: "#"
    end
  end

  context "when the recoed is not a new record" do
    it "is enabled" do
      expect(page).to have_no_css("a.disabled")
    end

    it "has a link to act" do
      expect(page).to have_css("a[href='#{act_path(act)}']")
    end
  end
end
