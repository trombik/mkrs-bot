# frozen_string_literal: true

# A form to create and edit Act
class Act::FormComponent < ViewComponent::Base
  attr_reader :act, :task_id

  def initialize(act, task_id)
    @act = act
    @task_id = task_id
    super()
  end

  def form_title
    "title_for_#{uniq_class_id}"
  end

  def submit_button
    "submit_button_for_#{uniq_class_id}"
  end

  def uniq_class_id
    helpers.class_id(self)
  end
end
