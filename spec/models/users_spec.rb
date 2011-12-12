require 'spec_helper'

describe Users do
  
    before(:each) do 
        @attr = { :first => "Tim", :last => "Ludikar", :email => "tim@autoassistant.ca" }
    end
    
    it "should require a valid input" do
        Users.create!(@attr)
    end
    
    it "should require a First name" do
        no_first = Users.new(@attr.merge(:first => ""))
        no_first.should_not be_valid
    end
    
    it "should require a valid length First name" do
        first_length = "a" * 51
        long_first = Users.new(@attr.merge(:first => first_length))
        long_first.should_not be_valid
    end
    
    it "should require a Last name" do
        no_last = Users.new(@attr.merge(:last => ""))
        no_last.should_not be_valid
    end
    
    it "should require a valid length Last name" do
        last_length = "a" * 51
        long_last = Users.new(@attr.merge(:last => last_length))
        long_last.should_not be_valid
    end
    
    it "should require a Email address" do
        no_last = Users.new(@attr.merge(:last => ""))
        no_last.should_not be_valid
    end
    
    it "should reject an invalid Email address" do
        addresses = %w[tim@autoassistant_ca tim_autoassistant.ca tim@autoassistant]
        addresses.each do |email|
            invalid_email = Users.new(@attr.merge(:email => email))
            invalid_email.should_not be_valid
        end
    end
    
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

