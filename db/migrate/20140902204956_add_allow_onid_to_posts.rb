class AddAllowOnidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :allow_onid, :boolean
  end
end
