class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :first_name
        t.string :message
      t.timestamps
    end
  end
end
