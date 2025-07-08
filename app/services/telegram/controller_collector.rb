# frozen_string_literal: true

module Telegram
  # Find all the defined TelegramBot controllers under
  # "app/controllers/telegram_bot".
  class ControllerCollector < ApplicationService
    def self.call
      new.call
    end

    def call
      classes
    end

    def file_from_classanme(file)
      path = Pathname(file).relative_path_from(root)
      class_name = path.to_s.gsub(".rb", "").camelize
      class_name.safe_constantize
    end

    def root
      Rails.root.join("app/controllers/")
    end

    def classes
      Dir.glob(root.join("telegram_bot/**/*.rb")).map { |file| file_from_classanme(file) }
    end
  end
end
