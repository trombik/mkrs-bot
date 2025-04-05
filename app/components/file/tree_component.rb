# frozen_string_literal: true

# A component to view directory tree under app/doc
class File::TreeComponent < ViewComponent::Base
  attr_accessor :root, :doc

  def initialize(root:, doc:)
    @root = root
    @doc = doc
    super
  end
end
