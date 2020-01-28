class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :invites, dependent: :destroy
  has_many :presences, through: :invites
  has_many :songs
  validates :email, uniqueness: true
end

private

def send_welcome_email
  UserMailer.with(user: self).welcome.deliver_now
end