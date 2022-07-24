class Art < ApplicationRecord
  belongs_to :artist
  has_many :purchase
  has_many :buyers, through: :purchase
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_description_artist,
    against: [ :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
