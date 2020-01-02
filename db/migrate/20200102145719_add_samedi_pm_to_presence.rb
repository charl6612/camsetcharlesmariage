class AddSamediPmToPresence < ActiveRecord::Migration[5.2]
  def change
    add_column :presences, :samedi_PM, :boolean
  end
end
