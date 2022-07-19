class Artist < ApplicationRecord
  has_many :buyers
  has_many :art
end
