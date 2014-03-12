class AddMeetingTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meeting_time, :datetime
    add_column :posts, :expire_time, :datetime
  end
end
