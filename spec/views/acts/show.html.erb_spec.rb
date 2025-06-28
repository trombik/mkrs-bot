# frozen_string_literal: true

require "rails_helper"

RSpec.describe "acts/show", type: :view do
  before do
    assign(:act, create(:act, task: create(:task, user: create(:user))))
  end

  # rubocop:disable RSpec/MultipleExpectations
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Description/)
  end
  # rubocop:enable RSpec/MultipleExpectations
end
