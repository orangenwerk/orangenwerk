# == Schema Information
# Schema version: 20100913141444
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean(1)
#  strangemaster      :boolean(1)
#  autor              :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'digest'
class User < ActiveRecord::Base

  attr_accessor :password
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # => email_regex = \A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
                    
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => true
  
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
  
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    user && user.has_password?(submitted_password) ? user : nil
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  
  
  
  

  private

    def encrypt_password
      self.salt = make_salt if new_record?
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
