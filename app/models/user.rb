
class User < ActiveRecord::Base

  has_secure_password

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
    if: :there_is_session

      def there_is_session
        :logged_in? != 'yes'
      end

  validates :firstname,
    presence: true,
    length: {maximum: 25}

  validates :tel,
    presence: true
end
