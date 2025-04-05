# frozen_string_literal: true

# The Telegram controller
class TelegramWebhooksController < Telegram::Bot::UpdatesController
  def start!(*)
    respond_with :message, text: t(".content")
  end

  def help!(*)
    respond_with :message, text: t(".content")
  end

  def message(message)
    respond_with :message, text: t(".content", text: message["text"])
  end

  def send_message(message)
    respond_with :message, text: message
  end

  def action_missing(_action, *_args)
    return unless action_type == :command

    respond_with :message,
                 text: t(".action_missing.command"),
                 command: action_options[:command]
  end
end
