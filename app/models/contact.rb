class Contact < ApplicationRecord
  belongs_to :teacher_room
  validates :content,presence: true, unless: :was_attached?
  has_one_attached :image


private
  def was_attached?
    self.image.attached?
  end
end
