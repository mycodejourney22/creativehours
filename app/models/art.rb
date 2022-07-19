class Art < ApplicationRecord
  belongs_to :artist
  has_many :purchase
  has_many :buyers, through: :purchase
end
