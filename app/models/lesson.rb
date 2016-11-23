class Lesson < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :lesson_time, :presence => true

  validates :student_id, :presence => true

  validates :trainer_id, :presence => true

end
