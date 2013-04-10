class Event < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :beginning
  validate :beginning_cannot_be_in_the_past

  attr_accessible :beginning, :description, :ending, :title

  private

  def beginning_cannot_be_in_the_past
    if !self.beginning.nil? && self.beginning < Time.now
      errors.add(:beginning, "can't be in the past")
    end
  end

end
