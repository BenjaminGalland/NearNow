class Event < ApplicationRecord
  include PgSearch::Model


  pg_search_scope :global_search,
  associated_against: {
    tags: [ :name ]
  }

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :tags, through: :event_tags

  accepts_nested_attributes_for :event_tags

  validates :name, :address, :start_date, :end_date, presence:true
  validates :max_people, numericality: { only_integer: true }
  validate :date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be anterior at start date!")
    end
  end

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < DateTime.now
      errors.add(:start_date, "can't be in the past!")
    end
  end

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

  def marker_class
    classes = []

    if public
      classes << 'public'
      classes << 'small-marker' if self.participants.count <= 9
      classes << 'medium-marker' if self.participants.count <= 19 && self.participants.count >= 10
      classes << 'large-marker' if self.participants.count <= 29 && self.participants.count >= 20
      classes << 'very-large-marker' if self.participants.count <= 39 && self.participants.count >= 30
      classes << 'big-marker' if self.participants.count <= 49 && self.participants.count >= 40
      classes << 'very-big-marker' if self.participants.count >= 50

    else
      classes << 'private'
      classes << 'small-marker' if self.participants.count <= 3
      classes << 'medium-marker' if self.participants.count <= 6 && self.participants.count >= 4
      classes << 'large-marker' if self.participants.count <= 11 && self.participants.count >= 7
      classes << 'very-large-marker' if self.participants.count <= 17 && self.participants.count >= 12
      classes << 'big-marker' if self.participants.count <= 25 && self.participants.count >= 18
      classes << 'very-big-marker' if self.participants.count >= 26

    end
    classes.join(' ')
  end
end
