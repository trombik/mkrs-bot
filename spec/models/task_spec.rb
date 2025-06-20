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

  describe "#staff_users" do
    it "assigns a StaffUser" do
      task.staff_users << create(:staff_user)

      expect(task.staff_users.first).to be_a StaffUser
    end

    it "increments the count of StaffMembership by one" do
      expect do
        task.staff_users << create(:staff_user)
      end.to change(TaskAssignment, :count).by(1)
    end

    # rubocop:disable RSpec/ExampleLength
    it "removes an assigned user" do
      staff_user = create(:staff_user)
      task.staff_users << create(:staff_user) << staff_user

      expect do
        task.update(
          name: task.name,
          description: task.description,
          staff_users: [staff_user],
          staff_groups: []
        )
      end.to change(TaskAssignment, :count).by(-1)
    end
    # rubocop:enable RSpec/ExampleLength
  end

  describe "#staff_groups" do
    it "assigns a StaffGroup" do
      task.staff_groups << create(:staff_group)

      expect(task.staff_groups.first).to be_a StaffGroup
    end

    it "increments the count of StaffMembership by one" do
      expect do
        task.staff_groups << create(:staff_group)
      end.to change(TaskAssignment, :count).by(1)
    end
  end

  describe "#assignees" do
    it "has Array of StaffUsers" do
      task.staff_users << create(:staff_user)
      task.staff_groups << create(:staff_group)

      expect(task.assignees.count).to eq 2
    end
  end

  describe "#expanded_assignees" do
    it "expands all the members of StaffGroup" do
      staff = create(:staff_user)
      group = create(:staff_group)
      group.staff_users << staff
      task.staff_groups << group

      expect(task.expanded_assignees.map { |element| element.include?(staff) }).to include(true)
    end
  end

  describe "#task_assignments" do
    it "returns TaskAssignment" do
      task.staff_users << create(:staff_user)

      expect(task.task_assignments.first).to be_a TaskAssignment
    end

    it "returns TaskAssignment and it points to a StaffUser" do
      staff = create(:staff_user)
      task.staff_users << staff

      expect(task.task_assignments.first.assignee).to eq staff
    end
  end
end
