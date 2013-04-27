class User < ActiveRecord::Base

  has_many :posts
  has_many :startupships
  has_many :startups, :through => :startupships
  has_many :comments, :as => :commentable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :username,
                  :role,
                  :realname,
                  :bio

  validates_presence_of :username
  validates_uniqueness_of :username

  validate :role_must_be_from_roles

  ROLES = %w[founder zip_team_member advisor mentor basic]

  # METHODS ---------------------------------------------------

  def admin
    true if self.role == 'founder' || self.role == 'zip_team_member'
  end

  def self.search(search)
    if search && search.blank? == false
      where('username ILIKE ? OR realname ILIKE ?', "%#{search}%", "%#{search}%")
    end
  end

  private

  def role_must_be_from_roles
    if !User::ROLES.include?("#{self.role}")
      errors.add(:role, "can't be custom, must be selected.")
    end
  end

end
