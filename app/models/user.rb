class User < ActiveRecord::Base
  attr_accessible :password, :hashed_password, :username
  validates :username, :presence => true, :length => { :minimum => 6, :maximum => 12 }, :uniqueness => true
  
  def password
    @password
  end
  
  def password=(password)
    return unless password
    @password = password
    generate_password(password)
  end
  
  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && Digest::SHA256.hexdigest(password + user.password_salt) == user.hashed_password
      return user
    end
    false
  end
  
  private
  
  def generate_password(password)
    salt = Array.new(10){ rand(1024).to_s(36) }.join
    self.password_salt = salt
    self.hashed_password = Digest::SHA256.hexdigest(password + salt)    
  end
  
  has_many :uploads
end
