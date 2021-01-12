class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :name, presence: true
 has_many :room_students
 has_many :rooms, through: :room_students
 has_many :messages
 belongs_to :teacher
 has_many :teacher_rooms
 has_one_attached :image

 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
 validates_format_of :password,on: :create, with: PASSWORD_REGEX, message: 'は半角の英字・数字を両方含んでください'
end
