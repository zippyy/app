class User < ActiveRecord::Base
  has_many :messages
  has_many :events

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  ## FIXME: Use `validates_format_of` instead: http://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_format_of
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # has_many :approvals

end
