class Batch < ActiveRecord::Base
  
  # RELATIONSHIPS
  has_many :startups

  # VALIDATIONS
  validates_presence_of :title

  # ATTRIBUTES
  attr_accessible :title

end
