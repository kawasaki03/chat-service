class Room < ApplicationRecord
  validates :name, presence: true
  has_many :room_students, dependent: :destroy
  has_many :students, through: :room_students, dependent: :destroy
  has_many :messages, dependent: :destroy
end
