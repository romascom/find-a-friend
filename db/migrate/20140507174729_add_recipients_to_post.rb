class AddRecipientsToPost < ActiveRecord::Migration
  def change
		add_column :posts, :recipients, :text
  end
end
