# frozen_string_literal: true

require "rails_helper"

RSpec.describe Act, type: :model do
  describe "validations" do
    before do
      create(:act, task: create(:task, user: create(:user)))
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value(true).for(:active) }
    it { is_expected.to allow_value("").for(:description) }
    it { is_expected.not_to allow_value(nil).for(:active) }
    it { is_expected.not_to allow_value("").for(:name) }
  end
end
