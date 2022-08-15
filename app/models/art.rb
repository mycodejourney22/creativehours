class Art < ApplicationRecord
  belongs_to :artist
  has_many :purchase
  acts_as_favoritable
  has_many :buyers, through: :purchase
  has_one_attached :photo
  monetize :price_cents
  validates :description, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_description_artist,
    against: [ :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
