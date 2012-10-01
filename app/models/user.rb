class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password

  has_many :microposts, dependent: :destroy
  
  before_save { |user| user.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 6 }
  validates :password_confirmation, presence: true

  def feed
    microposts.where("user_id = ?", id)
  end
end
