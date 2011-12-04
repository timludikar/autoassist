class Users < ActiveRecord::Base
    attr_accessible :first, :last, :email
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    #Postal Code regex - "A1A 2B2"
    postco_regex = /[A-Z]+[0-9]+[A-Z]+\s+[0-9]+[A-Z]+[0-9]/
    
    #Phone number regex - "(111)111-1111"
    phone_regex = /\A[(]+[0-9]{3}+[)]+[0-9]{3}+-[0-9]{4}/
    
    validates :first, 
        :presence => true, 
        :length => { :maximum => 50 }
    
    validates :last, 
        :presence => true,
        :length => { :maximum => 50 }
    
    validates :email, 
        :presence => true, 
        :format => { :with => email_regex }, 
        :uniqueness => true
    
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

