class Appointment < ActiveRecord::Base
  validates :date, :start_time, :end_time, :mentor_phase, :mentor_id, presence: true
  validate :date_valid, :time_valid

  has_many :appointment_topics
  has_many :topics, through: :appointment_topics
  has_many :reviews
  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"

  def passed?
		now = Time.now
		date.year < now.year || date.month < now.month || date.day < now.day || end_time.hour < now.hour || end_time.min < now.min
  end

  def open?
  	!self.student_id
  end

  def current_user_signed_up?(user)
    self.student_id == user.id
  end

  def received_review(user)
  	self.reviews.select{|rev| rev.author_id != user.id }
  end

  def date_valid
    if self.passed? 
      errors.add(:date, "has already passed")
    end
  end

  def time_valid
    time = (self.end_time.hour*60 - self.start_time.hour*60) + (self.end_time.min - self.start_time.min)
    unless time == 30 || time == 60
      errors.add(:time, "must be in only 30 or 60 minute slots")
    end
  end
end
