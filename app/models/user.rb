class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token, :bio, :task, :twitter
  has_secure_password
  has_many :tasks, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  validates :routine, length: { maximum: 5000 }

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
