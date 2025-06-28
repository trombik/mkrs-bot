# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/edit", type: :view do
  let(:act) { create(:act, task: create(:task, user: create(:user))) }

  before do
    assign(:act, act)
    assign(:task, act.task)
    render
  end

  it "shows which task the act belongs to" do
    expect(rendered).to match(/#{act.task.name}/)
  end
end
