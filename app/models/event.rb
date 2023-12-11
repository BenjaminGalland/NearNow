class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom
  has_many :participants
  has_many :tags, through: :event_tags

  validates :name, :address, :start_date, :end_date, presence:true
  validates :max_people, numericality: { only_integer: true }
  validate :date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be anterior at start date!")
    end
  end

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past!")
    end
  end

end
