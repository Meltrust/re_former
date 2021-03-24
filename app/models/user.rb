class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }
end
