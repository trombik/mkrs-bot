# frozen_string_literal: true

require "rails_helper"

RSpec.describe TaskAssignment, type: :model do
  describe "#new" do
    it "does not raise" do
      expect { described_class.new }.not_to raise_error
    end
  end
end
