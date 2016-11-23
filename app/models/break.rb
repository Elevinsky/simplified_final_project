class Break < ApplicationRecord
  # Direct associations

  belongs_to :trainer

  # Indirect associations

  # Validations

  validates :trainer_id, :presence => true

end
