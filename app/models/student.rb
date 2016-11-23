class Student < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :pin, :length => { :minimum => 4, :maximum => 4 }

end
