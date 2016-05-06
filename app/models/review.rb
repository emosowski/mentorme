class Review < ActiveRecord::Base
	validates :body, :rating, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # belongs_to :student, class_name: "User"
  # belongs_to :mentor, class_name: "User"

  belongs_to :appointment
end
