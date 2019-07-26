class Presence < ApplicationRecord
  belongs_to :invite
  validates :invite_id, uniqueness: { scope: :user_id }
  validates :mariage, inclusion: { in: [ true, false ] }
  validates :nuit_samedi, inclusion: { in: [ true, false ] }

end
