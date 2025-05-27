# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffGroupMembership, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:staff_user) }
    it { is_expected.to belong_to(:staff_group) }
  end

  describe "validations" do
    let(:staff_group) { create(:staff_group) }
    let(:staff_user) { create(:staff_user) }

    before do
      described_class.new(staff_group: staff_group, staff_user: staff_user)
    end

    it { is_expected.not_to allow_value(nil).for(:staff_user) }
    it { is_expected.not_to allow_value(nil).for(:staff_group) }
  end
end
