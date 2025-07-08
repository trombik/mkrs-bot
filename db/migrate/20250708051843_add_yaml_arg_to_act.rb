class AddYamlArgToAct < ActiveRecord::Migration[8.0]
  def change
    add_column :acts, :yaml_arg, :string
  end
end
