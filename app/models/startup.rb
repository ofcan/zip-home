class Startup < ActiveRecord::Base

  validates :name, :presence => true,
                   :uniqueness => true
  validates :short_description, :presence => true,
                                :length => { :maximum => 100 }
  validates_presence_of :long_description

end
