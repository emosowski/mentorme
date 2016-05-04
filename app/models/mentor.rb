class Mentor < User
  has_many :appointments, foreign_key: :mentor_id
end