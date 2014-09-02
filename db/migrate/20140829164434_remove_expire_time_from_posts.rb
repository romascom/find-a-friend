class RemoveExpireTimeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :expire_time, :datetime
  end
end
