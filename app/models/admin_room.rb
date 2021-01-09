class AdminRoom < ApplicationRecord
  validates :name, presence: true
  belongs_to :admin
  belongs_to :user
  has_many :contacts,dependent: :destroy
end
