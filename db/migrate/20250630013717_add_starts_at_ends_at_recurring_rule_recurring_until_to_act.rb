class AddStartsAtEndsAtRecurringRuleRecurringUntilToAct < ActiveRecord::Migration[8.0]
  def change
    add_column :acts, :starts_at, :datetime
    add_column :acts, :recurring_rule, :string
    add_column :acts, :recurring_until, :datetime
  end
end
