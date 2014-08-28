class Post < ActiveRecord::Base
  validates :title, :onid, :description, presence: true

  belongs_to :user

end
