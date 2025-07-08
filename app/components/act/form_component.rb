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

  private

  def equal_recurring_type_to?(type)
    act.schedule.to_s.downcase == type
  end

  def act_types
    Telegram::ControllerCollector.call.map { |c| c.to_s.gsub(/^TelegramBot::/, "").gsub("Controller", "") }
  end

  def act_type_description(act_type)
    "TelegramBot::#{act_type}Controller".safe_constantize&.description&.[](:about) || "no description"
  end

  def act_type_of?(act_type)
    act.act_type == act_type
  end
end
