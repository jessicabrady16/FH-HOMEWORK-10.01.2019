# frozen_string_literal: true

class Player < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, email: true
  validates :age, presence: true, inclusion: { in: 1..100 }
  belongs_to :team, optional: true

  def self.positions
    [
      'forward',
      'right back',
      'right midfielder',
      'defensive midfielder',
      'goalkeeper',
      'striker',
      'left midfielder',
      'defensive midfielder',
      'left back',
      'stopper',
      'sweeper'
    ]
  end

  validates :position, presence: true,
  inclusion: { in: Player.positions,
  message: '%{value} is not a valid position' }
end
