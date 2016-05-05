class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def feedback
  	self.appointments.map{|app|app.received_review}
  end

  def passed_appointments
  	self.appointments.select{|app|app.passed?}
  end
end
