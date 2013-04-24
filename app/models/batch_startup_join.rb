class BatchStartupJoin < ActiveRecord::Base

  # RELATIONSHIPS
  belongs_to :batch
  belongs_to :startup

  # ATTRIBUTES
  attr_accessible :batch, :startup

  # VALIDATION
  validates_presence_of :batch, :startup

end
