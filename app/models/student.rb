class Student < User
  has_many :appointments, foreign_key: :student_id
end