# frozen_string_literal: true

class Flash::MessageComponent < ViewComponent::Base
  attr_accessor :type

  def initialize(type:)
    @type = type.to_sym
    case @type
    when :alert, :notice
    else
      raise ArgumentError, "type must be one of :alert and :notice"
    end
  end

  private

  def alert_class
    case type
    when :alert
      "alert-warning"
    when :notice
      "alert-primary"
    end
  end

  def xlink_href
    case type
    when :alert
      "#exclamation-triangle-fill"
    when :notice
      "#info-fill"
    end
  end
end
