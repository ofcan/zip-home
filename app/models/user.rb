class User < ActiveRecord::Base

  has_many :posts

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
                  :role

  validates_presence_of :username
  validates_uniqueness_of :username

  validate :role_must_be_from_roles

  ROLES = %w[founder zip_team_member advisor mentor basic]

  # METHODS ---------------------------------------------------

  def admin
    true if self.role == 'founder' || self.role == 'zip_team_member'
  end

  private

  def role_must_be_from_roles
    if !User::ROLES.include?("#{self.role}")
      errors.add(:role, "can't be custom, must be selected.")
    end
  end

end
