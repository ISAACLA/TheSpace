class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :images
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :image_liked, through: :likes, source: :image

  has_many :attendees, dependent: :destroy
  has_many :events, through: :attendees

  has_many :friendships
  has_many :friends, :through => :friendships

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :zipcode, :state, presence:true
  validates :zipcode, length: {is:5}
  validates :state, length: {is:2}
  validates :email, presence:true, uniqueness: {case_sensitive:false}, format:{with:EMAIL_REGEX}

  before_save :email_lowercase
  private
    def email_lowercase
      self.email.downcase!
    end
end
