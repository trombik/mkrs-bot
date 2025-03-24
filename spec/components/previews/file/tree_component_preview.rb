# frozen_string_literal: true

class File::TreeComponentPreview < ViewComponent::Preview
  def default
    root = Rails.root.join("spec/fixtures/files/doc")
    Rails.configuration.x.doc.load_path = root
    doc = Doc.new
    render(File::TreeComponent.new(root: root, doc: doc))
  end
end
