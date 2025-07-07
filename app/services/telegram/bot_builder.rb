# frozen_string_literal: true

module Telegram
  # A builder to build Telegram::Bot::Client
  class BotBuilder < ApplicationService
    def self.call
      new.call
    end

    def call
      bot
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
  end
end
