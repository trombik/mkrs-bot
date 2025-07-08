# frozen_string_literal: true

# A class that takes an action in Task
class Act < ApplicationRecord
  include Recurrable
  include RecurrenceBuildable

  validates :active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :starts_at, presence: true
  validates :act_type, presence: true, telegram_class: true

  belongs_to :task

  def telegram_bot_class
    "TelegramBot::#{act_type}Controller".constantize
  end

  def all_telegram_bot_classes
    Telegram::ControllerCollector.call
  end
end
