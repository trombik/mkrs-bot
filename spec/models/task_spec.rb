# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  describe "validation" do
    subject { task }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value(nil).for(:description) }
  end

  describe "#user" do
    it "has a user" do
      expect(task.user).to eq user
    end
  end

  describe "#name" do
    it "is String" do
      expect(task.name).to be_a String
    end
  end

  describe "#description" do
    it "is String" do
      expect(task.description).to be_a String
    end
  end
end
