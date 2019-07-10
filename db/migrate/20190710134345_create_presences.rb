class CreatePresences < ActiveRecord::Migration[5.2]
  def change
    create_table :presences do |t|
      t.boolean :nuit_jeudi
      t.boolean :nuit_vendredi
      t.boolean :nuit_samedi
      t.boolean :mariage
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
