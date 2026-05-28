class ChangeStepNumberToString < ActiveRecord::Migration[7.1]
  def up
    change_column :steps, :step_number, :string
  end

  def down
    change_column :steps, :step_number, :integer, using: 'step_number::integer'
  end
end
