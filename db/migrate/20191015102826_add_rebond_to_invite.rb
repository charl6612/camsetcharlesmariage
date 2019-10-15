class AddRebondToInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :rebond, :boolean, default:false
  end
end