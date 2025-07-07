# frozen_string_literal: true

require "rails_helper"

RSpec.describe Telegram::ControllerBuilder do
  let(:builder) { described_class }
  let(:from) { { "id" => 123 } }
  let(:chat) { { "id" => 456 } }

  describe ".call" do
    it "returns the default class" do
      expect(builder.call(from, chat)).to be_a TelegramWebhooksController
    end

    context "when a controller class is given" do
      it "returns an instance of the class" do
        expect(
          builder.call(from, chat, class: TelegramBot::AskClosedQuestionController)
        ).to be_a TelegramBot::AskClosedQuestionController
      end
    end

    context "when a bot is given" do
      it "returns an instance of default class with the bot" do
        bot = Telegram::BotBuilder.call
        controller = builder.call(from, chat, bot: bot)

        expect(controller.bot).to eq bot
      end
    end
  end
end
