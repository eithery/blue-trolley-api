class UserAccount < ApplicationRecord
  has_many :participants, dependent: :destroy
  belongs_to :crew

  has_secure_password

  before_save do
    self.login.downcase!
    self.email.downcase!
  end
  before_save :create_remember_token, :generate_activation_tokens


private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


  def generate_activation_tokens
    self.activation_code = SecureRandom.hex[0, 6].to_i(16).to_s if self.activation_code.blank?
    self.activation_token = SecureRandom.urlsafe_base64 if self.activation_token.blank?
  end
end
