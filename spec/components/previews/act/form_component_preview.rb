# frozen_string_literal: true

class Act::FormComponentPreview < ViewComponent::Preview
  def default
    task = Task.first
    datetime = DateTime.current.beginning_of_hour.beginning_of_minute
    act = FactoryBot.build(:act, task: task, starts_at: datetime)
    render(Act::FormComponent.new(act, task.id))
  end
end
