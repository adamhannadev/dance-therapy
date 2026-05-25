class CreateSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :steps do |t|
      t.references :figure, null: false, foreign_key: true
      t.references :element, null: false, foreign_key: true
      t.integer :step_number
      t.string :foot_position
      t.string :details
      t.string :count

      t.timestamps
    end
  end
end
