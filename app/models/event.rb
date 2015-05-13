class Event < ActiveRecord::Base
  belongs_to :group

  has_many :attendances

  # validates :name, :desc, :loc,
  #   :on => :create,
  #   :presence => true

  # validates :max, :min,
  #   :on => :update,
  #   numericality: true


  # validates :date, :time,
  # :on => :update, :presence => true


end
