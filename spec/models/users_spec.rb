require 'spec_helper'

describe Users do
    before(:each) do 
        @attr = {   :first => "Tim", 
                    :last => "Ludikar", 
                    :email => "tim@autoassistant.ca", 
                    :address1 => "109 Front St E",
                    :postcode => "M5A 4P7",
                    :prov => "ON",
                    :phone_number => "(647)884-5895"}
    end
    
    it "should require a valid input" do
        Users.create!(@attr)
    end
    
    it "should require a First name" do
        no_first = User.new(@attr.merge(:first => ""))
        no_first.should_not be_valid
    end
    
    it "should require a valid length First name" do
        first_length = "a" * 51
        long_first = User.new(@attr.merge(:first => first_length))
        long_first.should_not be_valid
    end
    
    it "should require a Last name" do
        no_last = User.new(@attr.merge(:last => ""))
        no_last.should_not be_valid
    end
    
    it "should require a valid length Last name" do
        last_length = "a" * 51
        long_last = User.new(@attr.merge(:last => last_length))
        long_last.should_not be_valid
    end
    
    it "should require an address" do
        no_address = User.new(@attr.merge(:address1 => ""))
        no_address.should_not be_valid
    end
    
    it "should require a valid length Address" do
        address_length = "a" * 51
        long_address = User.new(@attr.merge(:address1 => address_length)).should_not be_valid
    end
    
    it "should require a Postal Code" do
        no_postcode = User.new(@attr.merge(:postcode => "")).should_not be_valid
    end
    
    it "should reject an invalid Postal Code" do
        invalid_postcode = %w["M5A4P7" "M55 4P7" "M5A 447" "M5$ 4P7" "m5a 4p7"]
        invalid_postcode.each do |postalcode|
            User.new(@attr.merge(:postcode => postalcode)).should_not be_valid
        end
    end
    
    it "should accept a valid Postal Code" do
        valid_postcode = %w["M5A 4P7"]
        valid_postcode.each do |postalcode|
            User.new(@attr.merge(:postcode => postalcode)).should be_valid
        end
    end
    
    it "should reject invalid phone numbers" do
        invalid_phone = %w["111-111-1111" "(111) 1111111" "(111#111-1111" "(111)111$1111" "(111)111-111A1" "(111)111-111"]
        invalid_phone.each do |phoneNumber|
            User.new(@attr.merge(:phone_number => phoneNumber)).should_not be_valid
        end
    end
    
    it "should accept valid phone number" do
        User.new(@attr.merge(:phone_number => "(111)111-1111")).should be_valid
    end
    
    it "should require a valid length phone number" do
        phone_length = "(" + "1" * 3 + ")" + "1" * 3 + "-" + "1" * 5
        long_phone = User.new(@attr.merge(:phone_number => phone_length)).should_not be_valid
    end
    
    it "should require a Province" do
        User.new(@attr.merge(:prov => "")).should_not be_valid
    end
end
