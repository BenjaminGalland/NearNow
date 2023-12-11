class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :messages
  has_many :participants, through: :messages
end
