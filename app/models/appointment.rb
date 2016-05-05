class Appointment < ActiveRecord::Base
  validates :date, :start_time, :end_time, :mentor_phase, :mentor_id, presence: true

  has_many :appointment_topics
  has_many :topics, through: :appointment_topics
  has_many :reviews
  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"

  def passed?
		now = Time.now
		date.year < now.year || date.month < now.month || date.day < now.day || time.hour < now.hour || time.min < now.minute
  end

  def open?
  	!self.student_id
  end

  def current_user_signed_up?(user)
    self.student_id == user.id
  end

  def received_review
  	self.reviews.select{|rev| rev.author_id != self.id }
  end

  private
    def date_valid
	    if self.passed?
	      errors.add(:model_years, "This date has passed")
	    end
	  end

end
