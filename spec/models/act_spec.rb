# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act, type: :model do
  let(:act) { create(:act, task: create(:task, user: create(:user))) }

  describe "validations" do
    before do
      act
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to allow_value(true).for(:active) }
    it { is_expected.to allow_value("").for(:description) }
    it { is_expected.not_to allow_value(nil).for(:active) }
    it { is_expected.not_to allow_value("").for(:name) }

    it { is_expected.to validate_presence_of(:act_type) }
    it { is_expected.not_to allow_value("foo").for(:act_type) }
    it { is_expected.to allow_value("AskClosedQuestion").for(:act_type) }

    it { is_expected.not_to allow_value("---\n foo: bar::").for(:yaml_arg) }
    it { is_expected.to allow_value("---\n foo: bar").for(:yaml_arg) }
  end

  describe "Recurrable" do
    it_behaves_like "Recurrable"
  end

  describe "RecurrenceBuildable" do
    it_behaves_like "RecurrenceBuildable"
  end

  describe "#telegram_bot_class" do
    it "returns TelegramBot class" do
      act.act_type = "AskClosedQuestion"
      expect(act.telegram_bot_class).to eq TelegramBot::AskClosedQuestionController
    end
  end
end
