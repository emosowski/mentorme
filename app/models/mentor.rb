class Mentor < User
  has_many :appointments, foreign_key: :mentor_id
  has_many :reviews, foreign_key: :author_id
end
