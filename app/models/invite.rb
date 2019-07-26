class Invite < ApplicationRecord
  belongs_to :user
  has_one :presence
end
