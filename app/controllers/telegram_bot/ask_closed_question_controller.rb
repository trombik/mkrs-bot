# frozen_string_literal: true

# A class for asking a closed question
class TelegramBot::AskClosedQuestionController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include FlowControllable
  include SessionKeyable

  def ask_closed_question(question, *choices)
    @question = question
    take_control!
    session[:choices] = choices
    save_context :answer_from_message
    message_with_keyboard(question, choices)
  end

  def answer_from_message(*words)
    answer = words.join(" ")
    if choices.include?(answer)
      respond_with :message, text: t(".correct_answer", answer: words.first)
      give_control!
    else
      respond_with :message, text: t(".wrong_answer")
      save_context :answer_from_message
    end
  end

  private

  def choices
    session[:choices].first
  end

  def message_with_keyboard(question, choices)
    respond_with :message,
                 text: question,
                 reply_markup: {
                   keyboard: [choices],
                   resize_keyboard: true,
                   one_time_keyboard: true
                 }
  end
end
