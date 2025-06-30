# frozen_string_literal: true

require "rails_helper"

shared_examples_for "Recurrable" do
  let(:model) { described_class }

  describe "#schedule" do
    let(:act_recurring) { Act.include_recurring.first }

    before do
      obj = create(model.to_s.downcase.to_sym, starts_at: 1.hour.from_now)
      obj.recurring_type = "daily"
      obj.save
    end

    it "returns next occurrence" do
      expect(act_recurring.schedule.occurs_on?(Time.zone.today)).to be true
    end
  end
end
