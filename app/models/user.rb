# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name,  presence: true, :length { maximum: 50 }
  VALIDATE_EMAIL_REGEX = /\A[\W+\-.]+@[a-z\d-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALIDATE_EMAIL_REGEX }
end
