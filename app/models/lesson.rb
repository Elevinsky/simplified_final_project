class Lesson < ApplicationRecord
  # Direct associations

  has_one    :cancellation_note,
             :dependent => :destroy

  belongs_to :trainer

  belongs_to :student,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :lesson_time, :presence => true

  validates :student_id, :uniqueness => { :scope => [:lesson_time], :message => "You already have a lesson at this time." }

  validates :student_id, :presence => true

  validates :trainer_id, :uniqueness => { :scope => [:lesson_time], :message => "Trainer is already booked" }

  validates :trainer_id, :presence => true

end
