class Contact < ApplicationRecord
  belongs_to :admin_room
  validates :content,presence: true
end
