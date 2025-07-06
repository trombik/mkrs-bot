# frozen_string_literal: true

# The Telegram controller
class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::Session

  after_action :cleanup

  def dispatch
    # when the message is update command, dispatch as usual
    return super if update["message"] && update["message"]["text"].starts_with?("/")

    # when another controller has taken the control, dispatch the class
    if update["message"] && session["controller"].present?
      session["controller"].dispatch(bot, update)
    else
      super
    end
  end

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
                 text: t(".action_missing.command", command: action_options[:command])
  end

  def session_key
    "#{bot.username}:#{chat["id"]}:#{from["id"]}" if chat && from
  end

  def cleanup
    session.delete("controller")
  end
end
