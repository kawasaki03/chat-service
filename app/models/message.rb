class Message < ApplicationRecord
  belongs_to :student
  belongs_to :room
  has_one_attached :image
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
