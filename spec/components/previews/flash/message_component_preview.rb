# frozen_string_literal: true

class Flash::MessageComponentPreview < ViewComponent::Preview
  def default
    render(Flash::MessageComponent.new(type: :notice)) do
      "This is notice"
    end
  end

  def notice
    render(Flash::MessageComponent.new(type: :notice)) do
      "This is notice"
    end
  end

  def dismissible_notice
    render(Flash::MessageComponent.new(type: :notice, dismissible: true)) do
      "Dismessible Notice"
    end
  end

  def alert
    render(Flash::MessageComponent.new(type: :alert)) do
      "This is alert"
    end
  end

  def with_link
    render(Flash::MessageComponent.new(type: :notice)) do
      tag.a(href: "http://example.org") do
        "With a link"
      end
    end
  end

  def long_text
    render(Flash::MessageComponent.new(type: :notice)) do
      "Returns an HTML block tag of type name surrounding the content. Add
      HTML attributes by passing an attributes hash to options. Instead of
      passing the content as an argument, you can also use a block in which
      case, you pass your options as the second parameter. Set escape to false
        to disable escaping. Note: this is legacy syntax, see tag method
        description for details."
    end
  end

  def dismissible_long_text
    render(Flash::MessageComponent.new(type: :notice, dismissible: true)) do
      text = tag.p "Returns an HTML block tag of type name surrounding the content. Add
      HTML attributes by passing an attributes hash to options. Instead of
      passing the content as an argument, you can also use a block in which
      case, you pass your options as the second parameter. Set escape to false
        to disable escaping. Note: this is legacy syntax, see tag method
        description for details."
      content = text
      content += tag.hr
      content += text
    end
  end
end
