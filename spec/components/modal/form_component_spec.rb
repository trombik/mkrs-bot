# frozen_string_literal: true

require "rails_helper"

RSpec.describe Modal::FormComponent, type: :component do
  let(:button_text) { "Open a modal" }
  let(:act) { build(:act, task: create(:task, user: create(:user))) }
  let(:form) { Act::FormComponent.new(act, act.task.id) }
  let(:modal) { described_class.new(button_text, form) }

  before do
    render_inline modal
  end

  it "has a modal" do
    expect(page).to have_css("div.modal")
  end

  it "has a form with a submit button" do
    expect(page).to have_css("div.modal-body form").and have_css("div.modal-footer input[type='submit']")
  end
end
