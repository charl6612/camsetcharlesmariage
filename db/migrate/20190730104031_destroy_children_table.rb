class DestroyChildrenTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :children
    add_column :invites, :child, :boolean, default:false
  end
end
