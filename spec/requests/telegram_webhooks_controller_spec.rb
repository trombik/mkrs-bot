# frozen_string_literal: true

require "rails_helper"

RSpec.describe TelegramWebhooksController, telegram_bot: :rails do
  describe "#start!" do
    let(:hello) { "Hello, world!" }

    it "greets" do
      expect { dispatch_command :start }.to respond_with_message hello
    end
  end

  describe "#help!" do
    it "respond_with_message Available commands:" do
      expect { dispatch_command :help }.to respond_with_message(/Available commands:/)
    end
  end

  describe "#message" do
    let(:text) { "foo bar" }

    it "replies with what the message was" do
      expect { dispatch_message text }.to respond_with_message(/You wrote: #{text}/)
    end
  end

  context "when the given command is unknown" do
    let(:command) { :UnknownCommand }

    it "says `cannot perform command`" do
      expect { dispatch_command command }.to respond_with_message(/Cannot perform command:/)
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
end
