require "rails_helper"

RSpec.describe Doc, type: :model do
  let(:load_path) { Rails.root.join("spec/fixtures/files/doc") }

  before do
    allow(Rails.configuration.x.doc).to receive(:load_path).and_return(load_path)
  end

  describe "#load_path" do
    it "is stubbed" do
      expect(described_class.new.load_path).to eq load_path
    end
  end

  describe "#show" do
    context "when file exist" do
      it "shows HTML" do
        expect(described_class.new.show("foo.md")).to match(/<h1 .*>Title<\/h1>/)
      end
    end

    context "when file does not exist" do
      it "raises Errno::ENOENT" do
        expect { described_class.new.show("404.md") }.to raise_error Errno::ENOENT
      end
    end

    context "when directory traversal is attempted" do
      it "raises Errno::ENOENT" do
        expect { described_class.new.show("../../../../Gemfile") }.to raise_error Errno::ENOENT
      end
    end

    context "when load_path has symlink to files in Rails.root" do
      it "raises Errno::ENOENT" do
        expect { described_class.new.show("Gemfile") }.to raise_error Errno::ENOENT
      end
    end
  end

  describe "#each_file" do
    it "returns array of markdown files" do
      files = []
      described_class.new.each_file { |file| files << file }
      expect(files.sort).to eq [ "foo.md", "bar.md" ].sort
    end

    context "when subdirectory is given" do
      it "returns markdown files under the directory" do
        files = []
        described_class.new.each_file("foo") { |file| files << file }
        expect(files.sort).to eq [ Pathname.new("foo/buz.md").to_s ]
      end
    end
  end

  describe "#each_dir" do
    it "calls the block given" do
      array = []
      described_class.new.each_dir { |dir| array << dir }
      expect(array).to eq [ "foo", "bar" ].sort
    end

    context "when .. is given" do
      it "returns load_path directory only" do
        array = []
        described_class.new.each_dir("..") { |dir| array << dir }
        expect(array).to eq [ load_path.to_s ]
      end
    end
  end
end
