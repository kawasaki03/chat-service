class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :students
  has_many :teacher_rooms
  validates :name,presence: true
  has_one_attached :image
  validates :status_message, length: { maximum: 50 }
  has_many :student_records

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password,on: :create, with: PASSWORD_REGEX, message: 'は半角の英字・数字を両方含んでください'
end
