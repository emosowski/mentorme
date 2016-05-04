class Appointment < ActiveRecord::Base
  validates :date, :start_time, :end_time, :mentor_phase, :mentor_id, presence: true

  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"
end
