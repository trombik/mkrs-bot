# frozen_string_literal: true

# a button to represents Act
class Act::ButtonComponent < ViewComponent::Base
  attr_reader :act

  def initialize(act)
    @act = act
    super
  end

  def path
    act.new_record? ? "#" : act_path(act)
  end

  def disabled
    act.new_record?
  end
end
