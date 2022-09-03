class User < ApplicationRecord
  before_save { self.email = email.downcase}
  #selfはメソッドを呼び出している時点のユーザーオブジェクトを指している。
  
  
  validates :name, presence: true, length: { maximum: 50}
  #emailの検証のための一文
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100},
            format: { with:VALID_EMAIL_REGEX},
            uniqueness: true
            
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
end
