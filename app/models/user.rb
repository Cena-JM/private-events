# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: 'event'
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def previous_events(type)
    send("#{type}_events").where('date < ?', DateTime.now)
  end

  def upcoming_events(type)
    send("#{type}_events").where('date > ?', DateTime.now)
  end
end
