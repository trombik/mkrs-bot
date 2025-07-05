# frozen_string_literal: true

require "rails_helper"

RSpec.describe TelegramWebhooksController, telegram_bot: :poller do
  let(:from) { { "id" => 123 } }
  let(:chat) { { "id" => 456 } }
  let(:controller) do
    described_class.new(bot, from: from, chat: chat)
  end

  describe "#start!" do
    it "greets" do
      expect { dispatch_command :start }.to respond_with_message I18n.t "telegram_webhooks.start.content"
    end
  end

  describe "#help!" do
    it "respond_with_message Available commands:" do
      expect { dispatch_command :help }.to respond_with_message I18n.t "telegram_webhooks.help.content"
    end
  end

  describe "#message" do
    let(:text) { "foo bar" }

    it "replies with what the message was" do
      expect { dispatch_message text }.to respond_with_message I18n.t("telegram_webhooks.message.content", text: text)
    end
  end

  describe "#send_message" do
    let(:text) { "foo bar" }
    let(:from) { { "id" => 123 } }
    let(:chat) { { "id" => 456 } }
    let(:bot) { Telegram::Bot::Client.new("TOKEN", "foo") }
    let(:controller) { described_class.new(bot, from: from, chat: chat) }

    it "sends a message" do
      expect { controller.process :send_message, text }.to respond_with_message(/^#{text}$/)
    end
  end

  context "when the given command is unknown" do
    let(:command) { :UnknownCommand }

    it "says `cannot perform command`" do
      expect { dispatch_command command }.to respond_with_message(/Cannot perform command: `UnknownCommand`/)
    end
  end

  context "when another controller took a control" do
    let(:another_class) { TelegramBot::AskClosedQuestionController }

    it "dispatches the controller" do
      another = another_class.new(bot, from: from, chat: chat)
      another.process :ask_closed_question, "foo", [1, 2]
      allow(another_class).to receive(:dispatch)
      dispatch_message "something", from: from, chat: chat

      expect(another_class).to have_received(:dispatch)
    end
  end
end
