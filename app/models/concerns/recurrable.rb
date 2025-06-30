# frozen_string_literal: true

# A module to create in-memory, recurring Act from Act.
module Recurrable
  extend ActiveSupport::Concern

  included do
    serialize :recurring_rule, coder: JSON
  end

  class_methods do
    def include_recurring(within: Time.current..6.months.from_now)
      acts = all.to_a
      recurring_acts = acts.select(&:recurring_rule).flat_map do |act|
        act.schedule.occurrences_between(within.begin, within.end).map do |date|
          next if date == act.starts_at

          Act::Recurring.new(act, date)
        end
      end.compact
      (acts + recurring_acts).sort_by(&:starts_at)
    end
  end

  def schedule
    @schedule ||= IceCube::Schedule.new(starts_at) do |schedule|
      schedule.add_recurrence_rule(IceCube::Rule.from_hash(JSON.parse(recurring_rule))) if recurring_rule
    end
  end
end
