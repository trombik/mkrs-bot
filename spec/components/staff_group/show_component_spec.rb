# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffGroup::ShowComponent, type: :component do
  let(:group) { create(:staff_group) }
  let(:users) do
    2.times.map { create(:staff_user, staff_groups: [group]) }
  end
  let(:default) { render_inline(described_class.new(group)) }

  it "has a list of members" do
    users.each do |user|
      expect(default).to have_content user.display_name
      expect(default).to have_link user.display_name, href: staff_user_path(user)
    end
  end
end
