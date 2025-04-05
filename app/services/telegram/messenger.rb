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

    def token
      Rails.application.credentials.telegram[:bot][:token]
    end

    def username
      Rails.application.credentials.telegram[:bot][:username]
    end

    def bot
      Telegram::Bot::Client.new(token, username)
    end

    def controller
      TelegramWebhooksController.new(bot, from: @from, chat: @chat)
    end

    def call
      controller.process(:send_message, *@args)
    end
  end
end
