# frozen_string_literal: true

class Task::FormComponentPreview < ViewComponent::Preview
  def default
    task = FactoryBot.build(:task, user: User.first, description: "")
    render(Task::FormComponent.new(task))
  end
end
