class Review < ActiveRecord::Base
	validates :body, :rating, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :appointment
end
