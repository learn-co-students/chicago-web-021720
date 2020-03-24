class User < ApplicationRecord
  has_many :shirts, foreign_key: :creator_id
  has_secure_password

  # def password
  #   BCrypt::Password.new(self.password_digest)
  # end

  # def password=(new_password)
  #   self.password_digest = BCrypt::Password.create(new_password)
  # end

  # def authenticate(pass_try)
  #   if self.password == pass_try
  #     return self
  #   end
  # end
end
