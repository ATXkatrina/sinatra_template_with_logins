class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password_arg)
    @password = BCrypt::Password.create(password_arg)
    self.hashed_password = @password
  end

  def authenticate(password_to_check)
    self.password == password_to_check
  end

end
