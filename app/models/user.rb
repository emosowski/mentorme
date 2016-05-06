class User < ActiveRecord::Base
  has_many :reviews, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def feedback
  	self.appointments.map{|app|app.received_review(self)}.flatten
  end

  def future_appointments
    self.appointments - passed_appointments
  end

  def passed_appointments
  	self.appointments.select{|app|app.passed?}
  end
end
