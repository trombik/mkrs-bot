# frozen_string_literal: true

require "rails_helper"

RSpec.describe Telegram::ControllerCollector do
  describe ".call" do
    it "returns all the controller class under app/controllers/telegram_bot" do
      classes = described_class.call
      expect(classes).to all(be < Telegram::Bot::UpdatesController)
    end
  end
end
