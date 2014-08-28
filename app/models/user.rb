class User < ActiveRecord::Base
  has_many :posts

  before_create :create_remember_token
   
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.current_user_id
    if current_user
      return current_user.id
    else
      return nil
    end
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
