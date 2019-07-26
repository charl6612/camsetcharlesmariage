class Invite < ApplicationRecord
  belongs_to :user
  has_many :presences
end
