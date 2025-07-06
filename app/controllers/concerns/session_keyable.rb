# frozen_string_literal: true

# A module to create session key
#
# requires `include Telegram::Bot::UpdatesController::Session`
module SessionKeyable
  extend ActiveSupport::Concern

  included do
    def session_key
      "#{bot.username}:#{chat["id"]}:#{from["id"]}" if chat && from
    end
  end
end
