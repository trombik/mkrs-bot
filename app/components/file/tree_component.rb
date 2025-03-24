# frozen_string_literal: true

class File::TreeComponent < ViewComponent::Base
  attr_accessor :root, :doc

  def initialize(root:, doc:)
    @root = root
    @doc = doc
  end
end
