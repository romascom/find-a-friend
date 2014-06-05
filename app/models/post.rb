class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
  validates :description, presence: true, length: {maximum: 255}
  validates :user_id, presence: true
end
