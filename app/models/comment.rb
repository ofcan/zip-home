class Comment < ActiveRecord::Base
  
  # RELATIONSHIPS
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  # VALIDATIONS
  validates :body, :presence => true
  validates :user, :presence => true
  validates :commentable, :presence => true

  # ATTRIBUTE ASSIGNMENT
  attr_accessible :body

end
