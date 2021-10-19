class User < ActiveRecord::Base
  has_secure_password  

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 6 }

  before_save :email_to_lowercase

  def email_to_lowercase
    self.email = self.email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end    
  end

end
