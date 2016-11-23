class Lesson < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :student_id, :presence => true

  validates :trainer_id, :presence => true

end
