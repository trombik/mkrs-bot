class CreateActs < ActiveRecord::Migration[8.0]
  def change
    create_table :acts do |t|
      t.string :name
      t.boolean :active, default: true, null: false
      t.string :description

      t.timestamps
    end
  end
end
