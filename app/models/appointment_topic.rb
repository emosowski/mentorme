class AppointmentTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :appointment
end
