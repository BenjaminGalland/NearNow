class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom
  has_many :participants
  has_many :tags, through: :event_tags
end
