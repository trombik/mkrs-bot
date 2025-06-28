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
end
