class PasswordValidator < ActiveModel::Validator
  def validate(record)
    if record.password == nil
      record.errors[:base] << "You didn't enter a password"
    end
  end
end


class User < ActiveRecord::Base

  has_secure_password

  has_many :groups
  has_many :memberships
  has_many :attendances

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates_with PasswordValidator

  validates :firstname,
    presence: true,
    length: {maximum: 25}

  validates :tel,
    presence: true
end
