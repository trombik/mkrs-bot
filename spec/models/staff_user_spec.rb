# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffUser, type: :model do
  describe "validations" do
    before do
      create(:staff_user)
    end

    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_presence_of(:account) }
    it { is_expected.to belong_to(:staff_group) }
  end
end
