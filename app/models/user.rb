class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teacher_appointment_relationships, foreign_key: :teacher, class_name: 'Appointment'
  has_many :teacher_appointments, through: :teacher_appointment_relationships, source: :teacher
  has_many :student_appointment_relationships, foreign_key: :student, class_name: 'Appointment'
  has_many :student_appointments, through: :student_appointment_relationships, source: :student
  has_many :emotions, through: :daily_emotions
  has_many :subjects
  has_many :class_memberships, through: :subjects
  has_many :students, through: :class_memberships, source: :student


  validates :first_name, presence: true
  validates :last_name, presence: true
end

