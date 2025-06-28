# frozen_string_literal: true

# a button to represents Act
class Act::ButtonComponent < ViewComponent::Base
  attr_reader :act

  def initialize(act)
    @act = act
    super
  end
end
