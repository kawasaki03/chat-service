class StudentRecord < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  validates :title,presence: true
  validates :note,presence: true
end
