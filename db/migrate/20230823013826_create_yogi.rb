class CreateYogi < ActiveRecord::Migration[7.0]
  def change
    create_table :yogis do |t|
      t.string :name
      t.integer :age
      t.boolean :member
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
