class AddReferencesToInvites < ActiveRecord::Migration[5.2]
  def change
    add_reference :presences, :invite, foreign_key: true
    add_reference :invites, :user, foreign_key: true
    add_reference :children, :user, foreign_key: true
  end
end
