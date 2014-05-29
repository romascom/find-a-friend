class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :recipients, presence: true, email: true
end
