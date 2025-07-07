# frozen_string_literal: true

require "rails_helper"

RSpec.describe Telegram::BotBuilder do
  let(:builder) { described_class }

  describe ".call" do
    it "returns Telegram::Bot::Client" do
      expect(builder.call).to be_a Telegram::Bot::Client
    end
  end
end
