require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user_good = User.create(first_name:"Meera",last_name:"Hale", email:"meerahale@someemail.com",password:"12345", password_confirmation: "12345")
    @user_bad = User.create(first_name:"Amelia",last_name:"Sweeting", email:"meerahale@someemail.com",password:"123", password_confirmation: "12345")
  end

  describe "Validations" do
    it "Gives error if not present" do
      @user_good.first_name = nil
      @user_good.last_name = nil
      @user_good.valid?
      expect(@user_good.errors.full_messages).to_not be_empty

    end
    it "Password should match" do
      expect(@user_good.password).to eql(@user_good.password_confirmation)
      @user_bad.valid?
      expect(@user_bad.errors.full_messages).to_not be_empty
    end

    it "Should give error if password doesnt match" do
      @user_bad.valid?
      expect(@user_bad.errors.full_messages).to_not be_empty
    end

    it "Should give error if password legnth is not 5" do
      @user_good.password = "123"
      @user_good.valid?
      expect(@user_bad.errors.full_messages).to_not be_empty
    end

    it "There should be unique email" do
      expect {
      @current_case = User.create(first_name:"Roxanne",last_name:"Richie", email:"meerahale@someemail.com",password:"12345", password_confirmation: "12345")
    }.to raise_exception(ActiveRecord::RecordNotUnique)
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return if valid email is in storage" do
      user = User.authenticate_with_credentials("meerahale@someemail.com","12345")
      expect(user).to eql(@user_good)
    end

    it "should return if valid even if email has spaces" do
      @current_case = User.create(first_name:"Maria",last_name:"Hill", email:"     mariahill@someemail.com", password:"12345", password_confirmation: "12345")
      @current_case.save

      user = User.authenticate_with_credentials("     mariahill@someemail.com","12345")

      expect(user).to eql(@current_case)
    end

    it "should return if valid email has different cases" do
      @current_case2 = User.create(first_name:"Sebastian",last_name:"Hill", email:"sebastianHill@someemail.com", password:"12345", password_confirmation: "12345")
      @current_case2.save

      user2 = User.authenticate_with_credentials("sebastianHill@someemail.com","12345")

      expect(user2).to eql(@current_case2)
    end

  end

end
