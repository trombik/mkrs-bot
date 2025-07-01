# frozen_string_literal: true

# A class for a form to update Task
class Task::FormComponent < ViewComponent::Base
  attr_reader :task

  def initialize(task)
    @task = task
    super
  end

  def all_groups
    StaffGroup.all
  end

  def all_users
    StaffUser.all
  end

  private

  def new_act
    new_act = Act.new
    new_act.starts_at = DateTime.current.beginning_of_minute.beginning_of_hour
    new_act
  end
end
