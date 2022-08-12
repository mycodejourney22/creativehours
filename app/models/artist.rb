class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buyers
  has_many :art
  has_many :orders
  validates :email, :uniqueness => {:allow_blank => true}
  has_one_attached :photo
  validates :name, presence: true
  validates :bio, presence: true
  validates :location, presence: true
end
