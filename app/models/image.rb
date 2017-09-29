class Image < ActiveRecord::Base
  belongs_to :user

  has_many :users, through: :likes
  has_many :likes, dependent: :destroy

  has_many :comments, as: :commentable

  has_attached_file :image, styles: { large:"600x600>", medium: "350x350>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
