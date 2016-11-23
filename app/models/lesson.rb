class Lesson < ApplicationRecord
  # Direct associations

  has_one    :cancellation_note,
             :dependent => :destroy

  belongs_to :trainer

  belongs_to :student

  # Indirect associations

  # Validations

  validates :lesson_time, :presence => true

  validates :student_id, :presence => true

  validates :trainer_id, :presence => true

end
