require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user_params = { name: 'test', email: 'test@verification.ca', password: 'password', password_confirmation: 'password' }
    end
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
    
  end
end
