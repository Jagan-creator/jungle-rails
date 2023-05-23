class User < ApplicationRecord

  #implement has_secure_password
  has_secure_password

  # authenticate email and password credentials
  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
