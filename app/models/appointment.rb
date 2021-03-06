class Appointment < ActiveRecord::Base
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :mentor_phase, presence: true
  validates :mentor_id, presence: true

  #validate :date_valid, :time_valid

  has_many :appointment_topics
  has_many :topics, through: :appointment_topics
  has_many :reviews
  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"

  def date_passed?
		now = Time.now
		date.year < now.year || date.month < now.month || date.day < now.day
  end

  def current_date?
    date == Date.today
  end

  def time_passed?
    current_date? && Time.now > end_time.getlocal
  end

  def passed?
    date_passed? || time_passed?
  end

  def open?
  	!student_id
  end

  def current_user_signed_up?(user)
    student_id == user.id
  end

  def received_review(user)
  	self.reviews.select{|rev| rev.author_id != user.id }
  end

  def date_valid
    if passed?
      errors.add(:date, "has already passed")
    end
  end

  def time_valid
    time = (end_time.hour * 60 - start_time.hour * 60) + (end_time.min - start_time.min)
    unless time == 30 || time == 60
      errors.add(:time, "must be in only 30 or 60 minute slots")
    end
  end
end
