require 'digest'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    #before_save :create_permalink
    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates_uniqueness_of :permalink
    
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
    
    #def to_param
    #    permalink
    #end

    private
    def create_permalink
        self.permalink = first.downcase
    end
    

end


