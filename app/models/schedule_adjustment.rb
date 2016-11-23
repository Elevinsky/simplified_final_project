class ScheduleAdjustment < ApplicationRecord
  # Direct associations

  belongs_to :trainer

  # Indirect associations

  # Validations

  validates :adjusted_end, :presence => true

  validates :adjusted_start, :presence => true

  validates :trainer_id, :presence => true

end
