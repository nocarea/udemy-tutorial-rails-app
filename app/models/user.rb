class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username,  presence: true,
                      uniqueness: { case_sesitive: false },
                          length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email,     presence: true,
                      uniqueness: { case_sesitive: false },
                          length: { minimum: 3, maximum: 105 },
                          format: { with: VALID_EMAIL_REGEX }
end
