class Post < ActiveRecord::Base
  
  # RELATIONSHIPS
  belongs_to :user
  has_many :comments, :as => :commentable

  # VALIDATIONS
  validates :user, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true
  validates_presence_of :featured_image
  validates_attachment_content_type :featured_image,
                                    :content_type => ["image/jpeg", "image/jpg", "image/png"],
                                    :size => { :in => 0..2.megabytes }

  # ATTRIBUTES
  attr_accessible :title,
                  :body,
                  :featured_image,
                  # following 3 attr are accessible because we use them for creating a
                  # startup Factory and are here purely for testing purposes
                  :featured_image_file_name, :featured_image_content_type, :featured_image_file_size

  has_attached_file :featured_image, :styles => { :large => "610x610>", :thumbnail => "200x200>" },
                                     :default_url => '/images/posts/:style/missing.png'

end
