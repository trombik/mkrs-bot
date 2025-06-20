class CreateTaskAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :task_assignments do |t|
      t.references :task, foreign_key: true
      t.references :assignee, polymorphic: true
      t.timestamps
    end
  end
end
