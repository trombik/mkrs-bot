# frozen_string_literal: true

class CreateStaffUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_users do |t|
      t.string :name
      t.string :account
      t.string :display_name
      # rubocop:disable Rails/ThreeStateBooleanColumn
      t.boolean :active
      # rubocop:enable Rails/ThreeStateBooleanColumn

      t.timestamps
    end

    create_table :staff_groups_users, id: false do |t|
      t.belongs_to :staff_user
      t.belongs_to :staff_group
    end
  end
end
