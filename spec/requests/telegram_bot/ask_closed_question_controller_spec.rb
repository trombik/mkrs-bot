# frozen_string_literal: true

require "rails_helper"

RSpec.describe TelegramBot::AskClosedQuestionController, telegram_bot: :poller do
  let(:from) { { "id" => 123 } }
  let(:chat) { { "id" => 456 } }
  let(:controller) do
    described_class.new(bot, from: from, chat: chat)
  end
  let(:question) { "Are you a bot?" }
  let(:choices) { %w[Yes No] }

  describe "#ask_closed_question" do
    it "asks a closed question with a keyboard" do
      expect do
        controller.process :ask_closed_question, question, choices
      end.to send_telegram_message(bot, question, reply_markup: hash_including(keyboard: [[choices]]))
    end
  end

  describe "#answer_from_message" do
    before do
      controller.process :ask_closed_question, question, choices
    end

    it "replies with the answer" do
      expect do
        dispatch_message choices.first, from: from, chat: chat
      end.to respond_with_message "Your answer is #{choices.first}"
    end

    context "when the answer is not in the choices" do
      it "asks try again" do
        expect do
          dispatch_message "wrong answer", from: from, chat: chat
        end.to respond_with_message "Choose one of the possible answer from the keyboard"
      end
    end

    context "when the answer is not in the choices but a correct choice is sent later" do
      it "accepts the correct one" do
        expect do
          dispatch_message "something wrong", from: from, chat: chat
          dispatch_message choices.first, from: from, chat: chat
        end.to respond_with_message "Your answer is #{choices.first}"
      end
    end
  end
end
