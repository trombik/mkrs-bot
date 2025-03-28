require "rails_helper"

RSpec.describe Telegram::Messenger, telegram_bot: :rails do
  let(:chat) { { "id" => 123 } }
  let(:messenger) { described_class.new(from: from, chat: chat, args: text) }

  describe ".call" do
    let(:text) { "Hi" }

    it "calls a method of TelegramWebhooksController" do
      allow(messenger).to receive(:bot).and_return(bot)

      expect { messenger.call }.to send_telegram_message(bot, text)
    end
  end
end
