class Presence < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :user_id }
  validates :mariage, inclusion: { in: [ true, false ] }
  validates :nuit_jeudi, inclusion: { in: [ true, false ] }
  validates :nuit_vendredi, inclusion: { in: [ true, false ] }
  validates :nuit_samedi, inclusion: { in: [ true, false ] }

end
