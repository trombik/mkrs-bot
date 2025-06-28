class AddDraftToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :draft, :boolean, default: true, null: false
  end
end
