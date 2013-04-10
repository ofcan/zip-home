class Event < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :beginning

  attr_accessible :beginning, :description, :ending, :title

end
