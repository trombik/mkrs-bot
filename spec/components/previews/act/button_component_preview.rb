# frozen_string_literal: true

class Act::ButtonComponentPreview < ViewComponent::Preview
  def default
    act = FactoryBot.build(
      :act,
      name: "Name of an act",
      description: "Description",
      task: FactoryBot.build(:task)
    )
    render(Act::ButtonComponent.new(act))
  end
end
