class RoomStudent < ApplicationRecord
  validates :student_id, presence: true
  belongs_to :student
  belongs_to :room
end
