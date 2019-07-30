class Invite < ApplicationRecord
  belongs_to :user
  has_one :presence, dependent: :destroy # destroys the associated presence
end
