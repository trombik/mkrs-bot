# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffGroup, type: :model do
  describe "validations" do
    before do
      create(:staff_group)
    end

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
