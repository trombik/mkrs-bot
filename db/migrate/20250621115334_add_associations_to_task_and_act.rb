class AddAssociationsToTaskAndAct < ActiveRecord::Migration[8.0]
  def change
    add_reference :acts, :task, foreign_key: true
    change_column_null :act, :task, false
  end
end
