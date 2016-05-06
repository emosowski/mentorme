class Review < ActiveRecord::Base
	validates :body, :rating, presence: true

  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"

  belongs_to :appointment
end
