# frozen_string_literal: true

require "rails_helper"

RSpec.describe File::TreeComponent, type: :component do
  let(:doc) { Doc.new }
  let(:root) { Rails.root.join("spec/fixtures/files/doc") }

  before do
    allow(Rails.configuration.x.doc).to receive(:load_path).and_return(root)
  end

  it "includes foo and bar directories" do
    render_inline(described_class.new(doc: doc, root: root))
    %w[foo bar].each do |text|
      expect(page).to have_css("li", text: text)
    end
  end

  it "has links to markdown files under the top directory" do
    render_inline(described_class.new(doc: doc, root: root))
    %w[foo.md bar.md].each do |filename|
      expect(page).to have_css("li a", text: filename)
    end
  end
end
