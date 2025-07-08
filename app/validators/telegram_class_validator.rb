# frozen_string_literal: true

# A validator to verify value is a valid TelegramBot contoller
class TelegramClassValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    message = "is not a valid type. Valid types are #{Telegram::ControllerCollector.call.join(", ")}"
    begin
      "TelegramBot::#{value}Controller".constantize
    rescue NameError
      record.errors.add attribute, (options[:message] || message)
    end
  end
end
