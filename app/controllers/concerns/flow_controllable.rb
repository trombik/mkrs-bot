# frozen_string_literal: true

# A concern to control routing in TelegramWebhooksController
module FlowControllable
  extend ActiveSupport::Concern

  CONTROLLER_FLYING_SESSION_KEY = "controller"

  included do
    # when take_control!, subsequence requests go to the calling class
    def take_control!
      session[CONTROLLER_FLYING_SESSION_KEY] = self.class
    end

    # when give_control!, subsequence requests go to TelegramWebhooksController
    def give_control!
      session.delete(CONTROLLER_FLYING_SESSION_KEY)
    end

    # the class that currecntly taking control
    def controller_flying
      session[CONTROLLER_FLYING_SESSION_KEY]
    end
  end
end
