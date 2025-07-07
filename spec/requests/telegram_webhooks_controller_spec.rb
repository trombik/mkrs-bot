# frozen_string_literal: true

require "rails_helper"

RSpec.describe TelegramWebhooksController, telegram_bot: :poller do
  include_context "with telegram context"
  let(:text) { "foo bar" }

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
    it "replies with what the message was" do
      expect { dispatch_message text }.to respond_with_message I18n.t("telegram_webhooks.message.content", text: text)
    end
  end

  describe "#send_message" do
    it "sends a message" do
      expect { controller.process :send_message, text }.to respond_with_message(/^#{text}$/)
    end
  end

  context "when the given command is unknown" do
    it "says `cannot perform command`" do
      expect { dispatch_command :UnknownCommand }.to respond_with_message(/Cannot perform command: `UnknownCommand`/)
    end
  end

  context "when another controller took a control" do
    let(:another_class) { TelegramBot::AskClosedQuestionController }

    before do
      another = another_class.new(bot, from: from, chat: chat)
      another.process :ask_closed_question, "foo", [1, 2]
      allow(another_class).to receive(:dispatch)
    end

    context "when the message is not a command" do
      it "dispatches the controller" do
        dispatch_message "something", from: from, chat: chat

        expect(another_class).to have_received(:dispatch)
      end
    end

    context "when the message is a command" do
      it "takes control back" do
        dispatch_command :help

        expect(another_class).not_to have_received(:dispatch)
      end

      it "does not dispatch another controller after that" do
        dispatch_command :help
        dispatch_message "something", from: from, chat: chat

        expect(another_class).not_to have_received(:dispatch)
      end
    end
  end
end
