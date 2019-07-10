class Family < ApplicationRecord
  has_many :children
  has_many :users
  validates :name, uniqueness: true
end
