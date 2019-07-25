class ChangeAttributesNametuUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :allowedbefore?, :allowedbefore
      t.rename :temoin?, :temoin
    end
  end
end
