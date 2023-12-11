class Tag < ApplicationRecord
  has_many :events, through: :event_tags
end
