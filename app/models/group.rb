class Group < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :memberships

  validates :name, :status,
  :on => :create,
  :presence => true

  validates :size,
  :on => :create,
  :presence => true,
  numericality: true



end
