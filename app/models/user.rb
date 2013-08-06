require "digest"
class User < ActiveRecord::Base

  has_many :evaluates
  has_one :token # API访问时的access_token
  has_many :posts, :through => :evaluates
  
  attr_accessible :email, :password, :password_confirmation

  validates :email, :presence=>true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}, :uniqueness=>true

  validates :password, :confirmation => true
  validate :password_check

  attr_accessor :password_confirmation
  attr_reader :password


  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end


  def User.find_by_token_value(token)
    self.joins(:token).where(:tokens=>{:value=>token}).first
  end

  def User.authenticate(email, password)
    if user = find_by_email(email)
      logger.debug(user.to_yaml)
      if user.hashed_password == encrypt_password(password,user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password + "twenty" + salt)
  end

  def new_token
    Digest::MD5.digest(self.email) + rand(36**8).to_s(36)
  end

  private 
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end

    def password_check
      errors.add(:password,"Missing password") unless hashed_password # for other attibutes update
    end

end