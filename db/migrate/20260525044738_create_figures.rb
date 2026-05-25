class CreateFigures < ActiveRecord::Migration[7.2]
  def change
    create_table :figures do |t|
      t.string :name
      t.string :role
      t.text :notes

      t.timestamps
    end
  end
end
