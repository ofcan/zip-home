class Startup < ActiveRecord::Base

  # VALIDATIONS
  validates :name, :presence => true,
                   :uniqueness => true
  validates :short_description, :presence => true,
                                :length => { :maximum => 100 }
  validates_presence_of :long_description

  # ATTRIBUTES
  attr_accessible :name,
                  :short_description,
                  :long_description

end
