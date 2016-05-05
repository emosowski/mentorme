class Student < User
  has_many :appointments, foreign_key: :student_id
  has_many :reviews, foreign_key: :author_id
end
