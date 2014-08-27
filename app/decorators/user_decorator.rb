class UserDecorator < Draper::Decorator
  decorates :user
  delegate_all

  def tag
    h.content_tag(:span,'',:id => "user-info", :data => data_hash)
  end

  def nil?
    object.nil?
  end 

  private

  def data_hash
    {:email => email
    }
  end

end
