require 'spec_helper'

describe Users do
  
    before(:each) do 
        @attr = { 
            :first => "Tim", 
            :last => "Ludikar", 
            :email => "tim@autoassistant.ca",
            :password => "password",
            :password_confirmation => "password"
        }
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
    
    describe "password validation" do
        
        it "should require a password" do
            no_password = Users.new(@attr.merge(:password => "", :password_confirmation => ""))
            no_password.should_not be_valid
        end
        
        it "should require a matching confirmation password" do
            Users.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
        end
        
        it "should reject short passwords" do
            short = "a" * 5
            hash = @attr.merge(:password => short, :password_confirmation => short)
            Users.new(hash).should_not be_valid
        end
        
        it "should reject long passwords" do
            long = "a" * 41
            hash = @attr.merge(:password => long, :password_confirmation => long)
            Users.new(hash).should_not be_valid
        end
        
    end
        
    describe "password encryption" do
        
        before(:each) do
            @user = Users.create!(@attr)
        end
        
        it "should have an encrypted password attribute" do
            @user.should respond_to(:encrypted_password)
        end

        
        describe "has_password? method" do
        
            it "should be true if the passwords match" do
                @user.has_password?(@attr[:password]).should be_true
            end
            
            it "should be false if the passwords don't match" do
                @user.has_password?("test").should be_true
            end
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

