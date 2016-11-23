class Student < ApplicationRecord
  # Direct associations

  has_many   :lessons,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  validates :pin, :length => { :minimum => 4, :maximum => 4 }

end
