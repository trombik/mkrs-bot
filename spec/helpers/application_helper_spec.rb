require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  let(:base) { Pathname.new("/etc") }
  let(:target) { Pathname.new("/etc/hosts") }
  let(:does_not_exist) { Pathname.new("/does_not_exist") }
  let(:tmp) { Pathname.new("/tmp") }

  describe "#include_directory?" do
    context "when base and target are String" do
      it "returns true" do
        expect(helper.include_directory?(base.to_s, target.to_s)).to be true
      end
    end

    context "when target is Pathname" do
      it "returns true" do
        expect(helper.include_directory?(base.to_s, target)).to be true
      end
    end

    context "when base is Pathname" do
      it "returns true" do
        expect(helper.include_directory?(base, target.to_s)).to be true
      end
    end

    context "when both is Pathname" do
      it "returns true" do
        expect(helper.include_directory?(base, target)).to be true
      end
    end

    context "when base and target is identical" do
      it "returns true" do
        expect(helper.include_directory?(base, base)).to be true
      end
    end

    it "returns false" do
      expect(helper.include_directory?(base, tmp)).to be false
    end

    context "when target does not exist" do
      it "returns false" do
        expect(helper.include_directory?(base, does_not_exist)).to be false
      end
    end

    context "when base directory_does_not_exist" do
      it "returns false" do
        expect(helper.include_directory?(does_not_exist, target)).to be false
      end
    end
  end
end
