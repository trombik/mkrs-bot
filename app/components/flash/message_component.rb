# frozen_string_literal: true

# A flash message comonent. It can be used as an alert box in content.
class Flash::MessageComponent < ViewComponent::Base
  attr_accessor :type

  ACCEPTABLE_TYPES = [:alert, :notice].freeze

  def initialize(type:, dismissible: false)
    @type = type.to_sym
    raise ArgumentError, "type must be one of :alert and :notice" unless ACCEPTABLE_TYPES.include?(@type)

    @dismissible = dismissible
    super
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

  def class_dismissible
    dismissible? ? "alert-dismissible fade show" : ""
  end

  def dismissible?
    @dismissible
  end
end
