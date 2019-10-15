class ChangeRebondName < ActiveRecord::Migration[5.2]
  def change
    change_table :invites do |t|
      t.rename :rebond, :allowedrebond
    end
  end
end
