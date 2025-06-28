# frozen_string_literal: true

# A component to create a modal, in which a form is rendered, and a button to
# open the modal.
#
# Usage:
#
# In a view:
#
# ```erb
# form = FormComponent.new
# <% modal = Modal::FormComponent.new("Open a form modal", form) %>
# <%= render modal %>
# ... other HTML ...
#
# <%= render modal.button %>
# ```
#
# The modal must be rendered first before `render modal.button`.
#
# The modal must NOT be rendered within other forms.
#
class Modal::FormComponent < ViewComponent::Base
  attr_reader :form, :button_text

  def initialize(button_text, form)
    @form = form
    @button_text = button_text
    super
  end

  def modal_id
    helpers.class_id(form)
  end

  def modal_label_id
    "#{modal_id}_label"
  end

  def button
    "button_for_#{modal_id}"
  end
end
