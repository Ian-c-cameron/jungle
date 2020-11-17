class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, email: true
  validates :password,
    :length => { :minimum => 8, :if => :validate_password? },
    :confirmation => { :if => :validate_password? }
  
  def self.authenticate_with_credentials(input_email, input_password)
    user = User.ci_find('email', input_email.strip)
    # If the user exists AND the password entered is correct.

    if user.class.to_s != 'User::ActiveRecord_Relation' && user.authenticate(input_password)
      user
    else
      nil
    end
  end

  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }


  private

  def validate_password?
    password.present? || password_confirmation.present?
  end
end
