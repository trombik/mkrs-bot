class AddNotNullConstraintOnActiveColumnToStaffUser < ActiveRecord::Migration[8.0]
  def change
    change_column_null(:staff_users, :active, false)
  end
end
