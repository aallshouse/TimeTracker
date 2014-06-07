# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  username           :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  role               :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :first_name, :last_name, :email, :username, :password, :password_confirmation

  has_and_belongs_to_many  :roles

  validates       :first_name,   :length       => { :maximum => 100 }
  validates       :last_name,    :length       => { :maximum => 100 }
  validates       :username,     :presence     => true,
                                 :length       => { :within => 3..100 }
  validates       :email,        :presence     => true,
                                 :format       => { :with => email_regex },
                                 :uniqueness   => { :case_sensitive => false }
  validates       :password,     :presence     => true,
                                 :confirmation => true,
                                 :length       => { :within => 6..40 }

  before_save     :encrypt_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
