class Post < ActiveRecord::Base
  validates :title, :user_id, :description, presence: true

  belongs_to :user

end
