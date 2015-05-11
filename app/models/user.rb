
class User < ActiveRecord::Base

  @@default_picture = 'xgv0flbmmozhi3anjyd2'


  def self.default_picture
    @@default_picture
  end

  def is_active?
    return :active
  end

  has_secure_password

  has_many :groups
  has_many :memberships
  has_many :attendances

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  with_options if: :is_active? do |user|
    user.validates :password, length: {minimum: 8}
    user.validates :password, presence: true
  end

  validates :firstname,
    presence: true,
    length: {maximum: 25}

  validates :tel,
    presence: true
end
