class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  
  # Validations
  validates_presence_of :full_name, :username, :email, :password_digest
  validates :username, uniqueness: true, format: {
    with: /\A[a-zA-Z]{5,15}\z/,
    message: "must contain letters and be between 5-15 characters"
  }
  validates :password, format: {
    with: /\A^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]{5,12}\z/,
    message: "must be alphanumerics and between 5-12 characters"
  }
  validates :email, uniqueness: true, format: {
    with: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "must be valid"
  }
  validates :phone_number, uniqueness: true, format: {
    with: /\A\d{11}\z/,
    message: "must be valid"
  }
end
