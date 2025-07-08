# frozen_string_literal: true

# A validator to verify value is a valid TelegramBot contoller
class ValidYamlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    message = "is not a valid YAML document"
    begin
      YAML.safe_load(value)
    rescue StandardError
      record.errors.add attribute, (options[:message] || message)
    end
  end
end
