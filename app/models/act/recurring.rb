# frozen_string_literal: true

# A model of in-memory, recurring Act from Act.
class Act::Recurring
  include ActiveModel::Model

  delegate :name, :active, :description, :task_id, :recurring_rule, :schedule, to: :@act
  attr_reader :starts_at

  def initialize(act, starts_at)
    @act = act
    @starts_at = starts_at
  end

  def persisted?
    false
  end
end
