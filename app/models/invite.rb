class Invite < ApplicationRecord
  before_save :before_save
  belongs_to :user
  has_one :presence, dependent: :destroy # destroys the associated presence
  validates :child, inclusion: { in: [ true, false ] }

  def before_save
    first_name.capitalize!
    last_name.capitalize!
  end
end
