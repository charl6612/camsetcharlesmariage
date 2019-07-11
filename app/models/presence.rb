class Presence < ApplicationRecord
  belongs_to :user
  validates :nuit_jeudi, presence: true
  validates :nuit_samedi, presence: true
  validates :nuit_vendredi, presence: true
  validates :mariage, presence: true
end
