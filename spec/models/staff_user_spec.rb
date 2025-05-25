# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffUser, type: :model do
  describe "validations" do
    before do
      create(:staff_user)
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to allow_value(true).for(:active) }
    it { is_expected.to allow_value(false).for(:active) }

    # The spec of Telegram account can be found at:
    # https://core.telegram.org/method/account.checkUsername
    it { is_expected.to validate_presence_of(:account) }
    it { is_expected.to allow_value("foo12345").for(:account) }
    it { is_expected.not_to allow_value("@foo12345").for(:account) }
    it { is_expected.to validate_length_of(:account).is_at_least(5) }
    it { is_expected.to validate_length_of(:account).is_at_most(32) }
  end
end
