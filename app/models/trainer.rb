class Trainer < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :tues_end_hour, :presence => true

  validates :tues_end_hour, :numericality => { :greater_than => 0, :less_than_or_equal_to => 12 }

  validates :tues_end_min, :presence => true

  validates :tues_start_am_pm, :presence => true

  validates :tues_start_hour, :presence => true

  validates :tues_start_hour, :numericality => { :greater_than => 0, :less_than_or_equal_to => 12 }

  validates :tues_start_min, :presence => true

  validates :wed_end_am_pm, :presence => true

  validates :wed_end_hour, :presence => true

  validates :wed_end_hour, :numericality => { :greater_than => 0, :less_than_or_equal_to => 12 }

  validates :wed_end_min, :presence => true

  validates :wed_start_am_pm, :presence => true

  validates :wed_start_hour, :presence => true

  validates :wed_start_hour, :numericality => { :greater_than => 0, :less_than_or_equal_to => 12 }

  validates :wed_start_min, :presence => true

end
