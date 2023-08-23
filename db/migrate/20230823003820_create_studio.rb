class CreateStudio < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.integer :rating
      t.boolean :accepting_members

      t.timestamps
    end
  end
end
