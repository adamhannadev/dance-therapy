class CreateElements < ActiveRecord::Migration[7.2]
  def change
    create_table :elements do |t|
      t.references :figure, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
