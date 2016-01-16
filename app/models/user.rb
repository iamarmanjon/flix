class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,
    format: { with: /\A\S+@\S+\z/ },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username, presence: true,
    format: { with: /\A[A-Z0-9]+\z/i },
    uniqueness: { case_insentive: false }
end