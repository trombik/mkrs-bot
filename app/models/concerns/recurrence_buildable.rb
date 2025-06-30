# frozen_string_literal: true

# A builder for Recurrable
module RecurrenceBuildable
  extend ActiveSupport::Concern
  RECURRING_TYPES = %w[daily weekly biweekly monthly].freeze

  included do
    attr_accessor :recurring_type, :recurring_until

    validates :recurring_type, inclusion: { in: RECURRING_TYPES + [nil] }

    before_save :set_recurring_rule
  end

  def recurring_types
    RECURRING_TYPES
  end

  private

  # rubocop:disable Metrics/AbcSize
  def set_recurring_rule
    return if recurring_type.blank?

    rule = case recurring_type
           when "daily" then IceCube::Rule.daily
           when "weekly" then IceCube::Rule.weekly.day(starts_at.wday)
           when "biweekly" then IceCube::Rule.weekly(2).day(starts_at.wday)
           when "monthly" then IceCube::Rule.monthly.day_of_month(starts_at.day)
           end
    rule = rule.until(recurring_until) if recurring_until.present?
    self.recurring_rule = rule.to_hash.to_json
  end
  # rubocop:enable Metrics/AbcSize
end
