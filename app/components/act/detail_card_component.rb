# frozen_string_literal: true

# A card to display an act in detail
class Act::DetailCardComponent < ViewComponent::Base
  attr_reader :act

  def initialize(act)
    @act = act
    super
  end

  private

  def disabled?
    act.new_record?
  end

  def edit_path
    disabled? ? "#" : edit_act_path(act)
  end
end
