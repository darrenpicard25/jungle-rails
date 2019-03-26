require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new firstname: "Darren", lastname: "Picard", email: "test@test.com", password: "hello", password_confirmation: "hello"
    @user2 = User.new firstname: "Darren", lastname: "Picard", email: "tEsT@teSt.com", password: "hello", password_confirmation: "hello"
  end

  describe "Signup Validations" do

    it "If everything passed in properly it should add to database" do
      expect(@user.valid?).to be_truthy
    end

    it "If firstname is missing will fail and give proper error" do
      @user.firstname = nil
      @user.save
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end

    it "If lastname is missing will fail and give proper error" do
      @user.lastname = nil
      @user.save
      expect(@user.errors.full_messages).to include "Lastname can't be blank"
    end

    it "If email is missing will fail and give proper error" do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "If password is missing will fail and give proper error" do
      @user = User.new firstname: "Darren", lastname: "Picard", email: "test@test.com", password_confirmation: "hello"
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "If password_confirmation is missing will fail and give proper error" do
      @user = User.new firstname: "Darren", lastname: "Picard", email: "test@test.com", password: "hello", password_confirmation: ""
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "If email already exists in the database it should give proper error" do
      @user.save
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "If password is less then 3 character gives error" do
      @user3 = User.new firstname: "Darren", lastname: "Picard", email: "test@test.com", password: "he", password_confirmation: "he"
      @user3.save
      expect(@user3.errors.full_messages).to include "Password is to short"
    end
  end

  describe '.authenticate_with_credentials' do

    it "If user logs in with no existent credentials" do
      @user.save
      @user_login = User.authenticate_with_credentials('darren@gmail.com', 'ello')
      expect(@user_login).to be_nil
    end

    it "If user logs in with imroper password" do
      @user.save
      @user_login = User.authenticate_with_credentials('test@test.com', ' ddddgjskello')
      expect(@user_login).to be_nil
    end

    it "all credetials are correct" do
      @user.save
      @user_login = User.authenticate_with_credentials('test@test.com', 'hello')
      expect(@user_login).to be_truthy
    end

    it "all credetials are correct but excess spaces" do
      @user.save
      @user_login = User.authenticate_with_credentials('   test@test.com   ', 'hello')
      expect(@user_login).to be_truthy
    end

    it "all credetials are correct but excess spaces" do
      @user.save
      @user_login = User.authenticate_with_credentials('   test@test.com   ', 'hello')
      expect(@user_login).to be_truthy
    end

    it "all credetials are correct but capitals letters" do
      @user.save
      @user_login = User.authenticate_with_credentials('teSt@tESt.Com', 'hello')
      expect(@user_login).to be_truthy
    end
  end
end
