# frozen_string_literal: true

# Create a table from models and resources.
class Table::WithActionsComponent < ViewComponent::Base
  attr_accessor :title, :columns, :items

  def initialize(title:, columns:, items:)
    @title = title
    @columns = columns
    @items = items
    super
  end
end
