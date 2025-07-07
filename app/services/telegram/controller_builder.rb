# frozen_string_literal: true

module Telegram
  # A builder to build TelegramWebhooksController
  class ControllerBuilder < ApplicationService
    def self.call(from, chat, **args)
      controller_class = args[:class] || TelegramWebhooksController
      bot = args[:bot] || Telegram::BotBuilder.call
      new(from, chat, bot, controller_class).call
    end

    def initialize(from, chat, bot, controller_class)
      @bot = bot
      @controller_class = controller_class
      @from = from
      @chat = chat
      super()
    end

    def call
      controller
    end

    def controller
      @controller_class.new(@bot, from: @from, chat: @chat)
    end
  end
end
