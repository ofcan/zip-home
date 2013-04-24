class Batch < ActiveRecord::Base
  
  # RELATIONSHIPS
  has_many :batch_startup_joins
  has_many :startups, :through => :batch_startup_joins

  # VALIDATIONS
  validates_presence_of :title

  # ATTRIBUTES
  attr_accessible :title

end
