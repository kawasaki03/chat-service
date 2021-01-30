class TeacherRoom < ApplicationRecord
  validates :name, presence: true
  belongs_to :teacher
  belongs_to :student
  has_many :contacts, dependent: :destroy
end
