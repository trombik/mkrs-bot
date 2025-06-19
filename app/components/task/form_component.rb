# frozen_string_literal: true

# A class for a form to update Task
class Task::FormComponent < ViewComponent::Base
  attr_reader :task

  def initialize(task)
    @task = task
    super
  end
end
