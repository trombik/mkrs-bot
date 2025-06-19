# frozen_string_literal: true

class Task::ShowComponentPreview < ViewComponent::Preview
  def default
    user = User.first
    task = Task.first || FactoryBot.create(:task, user: user)
    render(Task::ShowComponent.new(task))
  end
end
