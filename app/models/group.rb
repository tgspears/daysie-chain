class Group < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :memberships
end
