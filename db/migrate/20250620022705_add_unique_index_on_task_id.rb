class AddUniqueIndexOnTaskId < ActiveRecord::Migration[8.0]
  def change
    add_index(:task_assignments, [:task_id, :assignee_id, :assignee_type], unique: true)
  end
end
