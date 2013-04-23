class Startup < ActiveRecord::Base
  
  has_many :startupships
  has_many :users, :through => :startupships

  # VALIDATIONS
  validates :name, :presence => true,
                   :uniqueness => true
  validates :short_description, :presence => true,
                                :length => { :maximum => 100 }
  validates_presence_of :long_description
  validates_presence_of :logo
  validates_attachment_content_type :logo,
                                    :content_type => ["image/jpeg", "image/jpg", "image/png"],
                                    :size => { :in => 0..2.megabytes }

  # ATTRIBUTES
  attr_accessible :name,
                  :short_description,
                  :long_description,
                  :logo,
                  # following 3 attr are accessible because we use them for creating a
                  # startup Factory and are here purely for testing purposes
                  :logo_file_name, :logo_content_type, :logo_file_size

  has_attached_file :logo, :styles => { :standard => "300x300>" },
                           :default_url => '/images/startups/:style/missing.png'

  # CALLBACKS
  after_destroy :remove_startupships

  private

  def remove_startupships
    self.startupships.each do |startupship|
      startupship.destroy
    end
  end

end
