class Buyer < ApplicationRecord
  belongs_to :artist
  has_many :purchase
  has_many :art, through: :purchase
end
