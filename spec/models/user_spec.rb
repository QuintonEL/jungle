require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "is valid" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      expect(@user).to be_valid
    end

    it "has password and password_confirmation fields" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      @user.valid?
      expect(@user.password_confirmation).to be_present
      expect(@user.password).to be_present
    end

    it "has matching password and password_confirmation fields" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'word')
      @user.valid?
      expect(@user.errors[:password_confirmation].first).to eq "doesn't match Password"
    end

    it "has a unique email" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      @user.save
      @user2 = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      @user2.save
      expect(@user2.errors[:email].first).to eq "has already been taken"
    end

    it "has a valid email" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: nil, 
        password: 'password', 
        password_confirmation: 'password')
      expect(@user).to be_invalid
      expect(@user.errors[:email].first).to eq "can\'t be blank"
    end

    it "has a valid first name" do
      @user = User.new(
        first_name: nil, 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      expect(@user).to be_invalid
      expect(@user.errors[:first_name].first).to eq "can\'t be blank"
    end

    it "has a valid last name" do
      @user = User.new(
        first_name: 'first', 
        last_name: nil, 
        email: 'test@test.com', 
        password: 'password', 
        password_confirmation: 'password')
      expect(@user).to be_invalid
      expect(@user.errors[:last_name].first).to eq "can\'t be blank"
    end

    it "has a password longer than or equal to 8 characters" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: '1234567', 
        password_confirmation: '1234567')
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "should be valid with credentials" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'something', 
        password_confirmation: 'something')
      @user.save
      @user = User.authenticate_with_credentials('test@test.com', 'something')
      expect(@user).not_to be(nil)
    end

    it "should be invalid with wrong credentials" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'something', 
        password_confirmation: 'something')
      @user.save
      @user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(@user).to be(nil)
    end

    it "should be valid regardless of email case" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'something', 
        password_confirmation: 'something')
      @user.save
      @user = User.authenticate_with_credentials('TEST@tEst.com', 'something')
      expect(@user).not_to be(nil)
    end

    it "should be valid regardless of spaces around email" do
      @user = User.new(
        first_name: 'first', 
        last_name: 'last', 
        email: 'test@test.com', 
        password: 'something', 
        password_confirmation: 'something')
      @user.save
      @user = User.authenticate_with_credentials(' test@test.com ', 'something')
      expect(@user).not_to be(nil)
    end
  end
end
