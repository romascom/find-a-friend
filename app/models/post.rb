class Post < ActiveRecord::Base
  validates :title, :onid, :description, :location, presence: true

  belongs_to :user

end
