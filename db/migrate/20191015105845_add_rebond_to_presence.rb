class AddRebondToPresence < ActiveRecord::Migration[5.2]
  def change
    add_column :presences, :rebond, :boolean
  end
end
