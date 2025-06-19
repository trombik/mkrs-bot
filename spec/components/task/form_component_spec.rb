# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task::FormComponent, type: :component do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  describe "render" do
    it "renders" do
      expect do
        render_inline(described_class.new(task))
      end.not_to raise_error
    end
  end
end
