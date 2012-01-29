require 'digest'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
    #attr_accessible :email, :password, :password_confirmation, :remember_me
    
    #acts_as_authentic do |c|
    #end # block optional
    
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

end
