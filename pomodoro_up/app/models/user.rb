class User < ApplicationRecord
  has_secure_password
  has_many :task_lists

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
  validates :password, presence: true
end
