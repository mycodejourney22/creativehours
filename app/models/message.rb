class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :artist


  def sender?(a_artist)
    artist.id == a_artist.id
  end
end
