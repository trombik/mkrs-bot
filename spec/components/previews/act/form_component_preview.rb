# frozen_string_literal: true

class Act::FormComponentPreview < ViewComponent::Preview
  def default
    task = Task.first
    act = FactoryBot.build(:act, task: task)
    render(Act::FormComponent.new(act, task.id))
  end
end
