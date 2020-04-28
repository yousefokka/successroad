class User < ApplicationRecord
  validates :auth_token, uniqueness: true

  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = self.class.generate_unique_secure_token
    end while self.class.exists?(auth_token: auth_token)
  end
end

