class AddTableInvite < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :temoin, default:false
      t.boolean :allowedbefore, default:false
      t.timestamps
    end
  end
end
