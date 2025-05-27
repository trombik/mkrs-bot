class CreateStaffGroupMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :staff_group_memberships do |t|
      t.references :staff_user, null: false, foreign_key: true
      t.references :staff_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
