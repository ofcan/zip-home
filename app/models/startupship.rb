class Startupship < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :startup

  attr_accessible :user,
                  :startup

end
