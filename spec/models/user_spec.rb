require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user_params = { first_name: 'test', last_name: 'case', email: 'test@verification.ca', password: 'password', password_confirmation: 'password' }
  end

  describe 'Validations' do
    context "given all required values are present and valid" do
      it "successfully saves" do
        expect(User.new(@user_params))
          .to be_valid
      end
    end

    context "given unmatched password and password verification" do
      it "fails to save" do
        @user_params[:password_confirmation] = 'passvord'
        expect(User.new(@user_params))
          .not_to be_valid
      end
    end
    context "given a password with less than 8 characters" do
      it "fails to save" do
        @user_params[:password] = 'pasword'
        @user_params[:password_confirmation] = 'pasword'
        expect(User.new(@user_params))
            .not_to be_valid
      end
    end

    context "given a previously used email" do
      it "fails to save" do
        previous_params = { first_name: 'test1', last_name: 'case1', email: 'TEST@VERIFICATION.CA', password: 'password1', password_confirmation: 'password1' }
        User.new(previous_params).save
        expect(User.new(@user_params))
          .not_to be_valid
      end
    end

    context "given a missing" do
      context "first_name param" do
        it "fails to save" do
          expect(User.new(@user_params.except(:first_name)))
            .not_to be_valid
        end
      end
      context "last_name param" do
        it "fails to save" do
          expect(User.new(@user_params.except(:last_name)))
            .not_to be_valid
        end
      end
      context "email param" do
        it "fails to save" do
          expect(User.new(@user_params.except(:email)))
            .not_to be_valid
        end
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context "given an account email with a correct password" do
      it "returns the correct user" do
        user1 = User.new(@user_params)
        user1.save
        user2 = User.authenticate_with_credentials('test@verification.ca', 'password')
        #if they both have the same email, then they are the same user
        expect(user1.email).to eq user2.email 
      end
    end
    context "given an incorrect acount email" do
      it "returns nil" do
        user = User.authenticate_with_credentials('test2@verification.ca', 'password')
        expect(user).to eq nil 
      end
    end
    context "given an incorrect acount password" do
      it "returns nil" do
        User.new(@user_params).save
        user = User.authenticate_with_credentials('test@verification.ca', 'passwords')
        expect(user).to eq nil 
      end
    end

    context "given a correct email with white space padding on the start or end" do
      it "will accept it as valid" do
        User.new(@user_params).save
        user = User.authenticate_with_credentials('  test@verification.ca  ', 'password')
        expect(user.email).to eq 'test@verification.ca'
      end
    end
    context "given a correct email with upper case mixed in" do
      it "will accept it as valid" do
        User.new(@user_params).save
        user = User.authenticate_with_credentials('TeSt@VeriFication.CA', 'password')
        expect(user.email).to eq 'test@verification.ca'
      end
    end
  end
end
