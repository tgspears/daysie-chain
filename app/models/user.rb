
class User < ActiveRecord::Base

  @@default_picture = 'xgv0flbmmozhi3anjyd2'


  attr_accessor :active

  def self.default_picture
    @@default_picture
  end

  def is_active?
    puts active
    active == true;
  end

  before_validation :tel_format

  def tel_format
    self[:tel] = self[:tel].to_s.gsub(/[^0-9]/, "").prepend('1').to_i
  end

  has_secure_password :validations => false

  has_many :groups
  has_many :memberships
  has_many :attendances

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :password,
    presence: true,
    length: {minimum: 8},
    on: :create,
    if: :is_active?


  validates :firstname,
    presence: true,
    length: {maximum: 25}

  validates :tel,
    presence: true
end
