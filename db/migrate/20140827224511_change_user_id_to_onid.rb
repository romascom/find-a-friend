class ChangeUserIdToOnid < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :user_id
    end
    change_table :users do |t|
      t.rename :email, :onid
    end
  end
end
