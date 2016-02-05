
class User < ActiveRecord::Base

  attr_accessor :active

  before_save :format_tel

  def is_active?
    puts active
    active == true;
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
    uniqueness: {case_sensitive: false},
    presence: true

  private

  def format_tel
    formatted_tel = self[:tel].to_s.gsub(/[^0-9]/, "")
    if formatted_tel.length == 10
      self[:tel] = formatted_tel.prepend('1').to_i
    end
  end

end
