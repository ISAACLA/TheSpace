class Event < ActiveRecord::Base
  belongs_to :user

  has_many :users, through: :attendees
  has_many :attendees, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :description, :date, :time, :address, :city, :state, :zipcode, presence:true
  validates :state, length:{is:2}
  validates :zipcode, length:{is:5}
end
