class Review < ActiveRecord::Base

<<<<<<< HEAD
=======
  belongs_to :student, class_name: "User"
  belongs_to :mentor, class_name: "User"

  belongs_to :appointment
>>>>>>> master
end
