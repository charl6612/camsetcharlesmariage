class Presence < ApplicationRecord
  belongs_to :invite
  # validates :mariage, inclusion: { in: [ true, false ] }
  # validates :nuit_samedi, inclusion: { in: [ true, false ] }
end
