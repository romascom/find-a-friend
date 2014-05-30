class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :recipients, email: true
end
