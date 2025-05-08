# frozen_string_literal: true

class CreateStaffUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_users do |t|
      t.references :staff_group, null: false, foreign_key: true
      t.string :display_name, null: false
      t.string :account

      t.timestamps
    end
  end
end
