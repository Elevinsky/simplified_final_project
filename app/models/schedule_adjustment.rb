class ScheduleAdjustment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :adjusted_start, :presence => true

  validates :trainer_id, :presence => true

end
