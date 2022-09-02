class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buyers
  has_many :art
  acts_as_favoritor
  has_many :orders
  validates :email, :uniqueness => {:allow_blank => true}
  has_one_attached :photo
  validates :name, presence: true
  validates :location, presence: true
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following



  def follow(artist_id)
    following_relationships.create(following_id: artist_id)
  end

  def unfollow(artist_id)
    following_relationships.find_by(following_id: artist_id).destroy
  end

  def is_following?(artist_id)
    relationship = Follow.find_by(follower_id: id, following_id: artist_id)
    return true if relationship
  end
end
