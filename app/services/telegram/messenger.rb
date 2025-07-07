# frozen_string_literal: true

module Telegram
  # A Telegram service to take actions without update
  #
  # Telegram::Messenger.call(
  #   from: from,
  #   chat: chat,
  #   args: args
  # )
  class Messenger < ApplicationService
    def initialize(from:, chat:, args: [])
      @from = from
      @chat = chat
      @args = args
      super()
    end

    def self.call(from:, chat:, args: [])
      new(from: from, chat: chat, args: args).call
    end

    def bot
      Telegram::BotBuilder.call(@from, @chat)
    end

    def controller
      Telegram::ControllerBuilder.call(@from, @chat, bot: bot)
    end

    def call
      controller.process(:send_message, *@args)
    end
  end
end
