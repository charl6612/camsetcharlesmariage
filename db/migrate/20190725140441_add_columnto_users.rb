class AddColumntoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :temoin?, :boolean, default:false
    add_column :users, :allowedbefore?, :boolean, default:false
  end
end
