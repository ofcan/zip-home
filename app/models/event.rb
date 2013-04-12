class Event < ActiveRecord::Base

  validates_presence_of :title,
                        :description,
                        :beginning,
                        :location

  validate :beginning_cannot_be_in_the_past,
           :ending_cannot_be_before_beginning

  attr_accessible :title,
                  :description,
                  :beginning,
                  :ending,
                  :location

  scope :past, where('beginning < ? AND ending IS NULL OR ending < ?', Time.now.beginning_of_day, Time.now.beginning_of_day)
  scope :upcoming, where('beginning > ?', Time.now.end_of_day)
  scope :today, where(:beginning => (Time.now.beginning_of_day..Time.now.end_of_day))

  private

  def beginning_cannot_be_in_the_past
    if !self.beginning.nil? && self.beginning < Time.now
      errors.add(:beginning, "can't be in the past.")
    end
  end

  def ending_cannot_be_before_beginning
    if !self.beginning.nil? && !self.ending.nil? && self.beginning > self.ending
      errors.add(:ending, "can't be before the event begun.")
    end
  end

end
