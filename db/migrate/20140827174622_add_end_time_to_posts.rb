class AddEndTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :end_time, :datetime
  end
end
