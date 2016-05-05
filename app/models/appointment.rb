class Appointment < ActiveRecord::Base
  validates :date, :start_time, :end_time, :mentor_phase, :mentor_id, presence: true
  has_many :appointment_topics
  has_many :topics, through: :appointment_topics
  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"
end
