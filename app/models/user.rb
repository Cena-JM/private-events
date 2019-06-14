# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances
  has_many :event_as_attendee, through: :attendances, source: 'event'
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def previous_events
    Event.where('date < ?', Time.zone.today)
  end

  def upcoming_events
    Event.where('date > ?', Time.zone.today)
  end
end
