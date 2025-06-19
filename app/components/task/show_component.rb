# frozen_string_literal: true

# A component to render a Task
class Task::ShowComponent < ViewComponent::Base
  attr_reader :task

  def initialize(task)
    @task = task
    super
  end
end
