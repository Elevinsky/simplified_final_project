class Student < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :pin, :length => { :minimum => 4, :maximum => 4 }

end
