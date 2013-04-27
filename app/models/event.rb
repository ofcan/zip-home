class Event < ActiveRecord::Base
  
  # RELATIONSHIPS
  has_many :comments, :as => :commentable

  # VALIDATIONS
  validates_presence_of :title,
                        :description,
                        :beginning,
                        :location
  validates_presence_of :featured_image
  validates_attachment_content_type :featured_image,
                                    :content_type => ["image/jpeg", "image/jpg", "image/png"],
                                    :size => { :in => 0..2.megabytes }

  validate :beginning_cannot_be_in_the_past,
           :ending_cannot_be_before_beginning

  # ATTRIBUTES
  attr_accessible :title,
                  :description,
                  :beginning,
                  :ending,
                  :location,
                  :featured_image,
                  # following 3 attr are accessible because we use them for creating a
                  # startup Factory and are here purely for testing purposes
                  :featured_image_file_name, :featured_image_content_type, :featured_image_file_size

  has_attached_file :featured_image, :styles => { :large => "610x610>", :thumbnail => "200x200>" },
                                     :default_url => '/images/events/:style/missing.png'

  # SCOPES
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
