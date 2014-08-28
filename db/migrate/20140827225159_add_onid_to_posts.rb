class AddOnidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :onid, :string
  end
end
