# frozen_string_literal: true

# A mailer for the application
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
