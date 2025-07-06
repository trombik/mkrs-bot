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

  # rubocop:disable RSpec/MultipleMemoizedHelpers
  describe "control of the flow" do
    let(:update) { { message: { from: from, chat: chat, text: "foobarbuz" } }.as_json }

    before do
      # start the flow in the described_class
      controller.process :ask_closed_question, question, choices
    end

    context "when the answer is correct one" do
      it "takes control form the main controller" do
        allow(described_class).to receive(:dispatch)
        dispatch_message choices.first, from: from, chat: chat

        expect(described_class).to have_received(:dispatch).exactly(1).times
      end

      it "gives the control to the main one" do
        dispatch_message choices.first, from: from, chat: chat
        allow(described_class).to receive(:dispatch)
        TelegramWebhooksController.dispatch(bot, update)

        expect(described_class).to have_received(:dispatch).exactly(0).times
      end
    end

    context "when the answer is incorrect one" do
      it "takes control form the main controller" do
        allow(described_class).to receive(:dispatch)
        dispatch_message "foo", from: from, chat: chat

        expect(described_class).to have_received(:dispatch).exactly(1).times
      end

      it "still keeps the control" do
        dispatch_message "wrong answer", from: from, chat: chat
        allow(described_class).to receive(:dispatch)
        TelegramWebhooksController.dispatch(bot, update)

        expect(described_class).to have_received(:dispatch).exactly(1).times
      end
    end
    # rubocop:enable RSpec/MultipleMemoizedHelpers
  end
end
