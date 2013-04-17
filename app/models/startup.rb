class Startup < ActiveRecord::Base

  validates_presence_of :name,
                        :short_description,
                        :long_description

end
