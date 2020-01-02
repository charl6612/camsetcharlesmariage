class ChangeSamediName < ActiveRecord::Migration[5.2]
  def change
    change_table :presences do |t|
      t.rename :Samedi_PM, :samedi_pm
    end
  end
end
