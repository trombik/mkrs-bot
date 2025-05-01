# frozen_string_literal: true

class CreateStaffGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_groups do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :staff_groups, :name, unique: true
  end
end
