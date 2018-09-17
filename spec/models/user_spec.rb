require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do 

    user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    

    it "is valid with all the correct date" do
      expect(user).to be_valid
    end

    it "is not valid without a first name" do 
      user = User.new(first_name: nil, last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(user).to_not be_valid 
    end

    it "is not valid without a last name" do 
      user = User.new(first_name: "John", last_name: nil, email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(user).to_not be_valid 
    end

    it "is not valid without an email address" do 
      user = User.new(first_name: "John", last_name: "Smith", email: nil, password: "123", password_confirmation: "123")    
      expect(user).to_not be_valid 
    end

    it "is not valid without a password" do 
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: nil, password_confirmation: "123")    
      expect(user).to_not be_valid 
    end

    it "is not valid without a password confirmation" do 
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: nil)    
      expect(user).to_not be_valid 
    end

    it "is not valid when password and password confirmation don't match" do 
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "456")    
      expect(user).to_not be_valid 
    end

    it "is not valid when password is less the 2 characters long" do 
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "1", password_confirmation: "1")    
      expect(user).to_not be_valid 
    end

    it "is not valid when the email address already exists in the database" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")          
      user.save!
      user_two = User.new(first_name: "john", last_name: "Doe", email: "john@john.com", password: "456", password_confirmation: "456")
      expect(user_two).to_not be_valid
    end

    it "is not valid when the email address already exists with a different case in the database" do
      user = User.new(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")          
      user.save!      
      user_two = User.new(first_name: "john", last_name: "Doe", email: "john@JOHN.com", password: "456", password_confirmation: "456")    
      expect(user_two).to_not be_valid 
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "is valid with all the correct data" do 
      user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials("doe@doe.com", "123")).to be_an_instance_of(User)
    end
    
    it "is not valid without an email address" do 
      user = User.create!(first_name: "John", last_name: "Smith", email: "john@doe.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials(nil, user.password)).to be_nil 
    end

    it "is not valid without a password" do 
      user = User.create!(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials(user.email, nil)).to be_nil 
    end

    it "is not valid when the password is wrong" do 
      user = User.create!(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials(user.email, "456")).to be_nil 
    end

    it "is not valid when the email is wrong" do 
      user = User.create!(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials("john@doe.com", "123")).to be_nil 
    end

    it "is valid when the email is lead by a space" do 
      user = User.create!(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
      expect(User.authenticate_with_credentials("  john@john.com", "123")).to be_an_instance_of(User)
    end

    # it "is valid when the email is in a different case" do 
    #   user = User.create!(first_name: "John", last_name: "Smith", email: "john@john.com", password: "123", password_confirmation: "123")    
    #   expect(User.authenticate_with_credentials("john@JOHN.com", "123")).to be_an_instance_of(User)
    # end

    
  end

end
