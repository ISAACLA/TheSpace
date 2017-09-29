class Friendship < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :friend, :class_name => 'User'
end
