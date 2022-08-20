class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :requester, foreign_key: 'requester_id', class_name: 'Artist'
  belongs_to :requestee, foreign_key: 'requestee_id', class_name: 'Artist'
end
