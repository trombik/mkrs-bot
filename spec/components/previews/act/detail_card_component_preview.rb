# frozen_string_literal: true

require "faker"

class Act::DetailCardComponentPreview < ViewComponent::Preview
  def default
    task = Task.first
    act = FactoryBot.build(
      :act,
      name: "Send a message to #{Faker::Verb.base}",
      description: Faker::Lorem.paragraph(sentence_count: 20),
      task: task,
      created_at: 5.minutes.ago,
      updated_at: 3.minutes.ago
    )
    render(Act::DetailCardComponent.new(act))
  end
end
