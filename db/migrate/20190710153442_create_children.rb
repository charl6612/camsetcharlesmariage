class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.integer :age
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
