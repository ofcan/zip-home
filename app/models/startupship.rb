class Startupship < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :startup

end
