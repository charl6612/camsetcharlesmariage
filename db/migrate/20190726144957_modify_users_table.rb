class ModifyUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :temoin, :string
    remove_column :users, :allowedbefore, :string
    remove_column :users, :family_id, :string
    remove_column :children, :family_id, :string
    remove_column :presences, :user_id, :string
    drop_table :families
  end
end
