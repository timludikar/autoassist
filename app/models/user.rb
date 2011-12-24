require 'digest'
class User < ActiveRecord::Base
    
    attr_accessor :password
    attr_accessible :first, 
                    :last, 
                    :email, 
                    :address1, 
                    :address2,
                    :postcode,
                    :phone_number,
                    :prov,
                    :password, 
                    :password_confirmation
    
    #Email regex
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    #Postal Code regex - "A1A 2B2"
    postco_regex = /[A-Z]+[0-9]+[A-Z]+\s+[0-9]+[A-Z]+[0-9]/
    
    #Phone number regex - "(111)111-1111"
    phone_regex = /\A[(]+[0-9]{3}+[)]+[0-9]{3}+-[0-9]{4}/
    
    validates :first, :presence => true, :length => { :maximum => 50 }
    validates :last, :presence => true, :length => { :maximum => 50 }
    validates :address1, :presence => true, :length => { :maximum => 50 }
    validates :postcode, :presence => true, :format => { :with => postco_regex }
    validates :phone_number, :presence => true, :format => { :with => phone_regex }
    validates :prov, :presence => true
    validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
    validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }
    
    before_save :encrypt_password
    
    def has_password?(submitted_password)
        encrypted_password == encrypt(submitted_password)
    end
    
    def self.authenicate(email, submitted_password)
        user = find_by_email(email)
        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end
    
    def self.authenicate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        return nil if user.nil?
        return user if user.salt == cookie_salt
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
