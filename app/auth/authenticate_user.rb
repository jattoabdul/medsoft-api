class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :reg_id, :full_name, :username, :sex, :password, :password_confirmation, :address, :phone_number, :email, :date_employed, :is_admin

  #this is where parameters are taken when the command is called
  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end
  
  #this is where the result gets returned
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end