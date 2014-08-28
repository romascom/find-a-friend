class DropUserTable < ActiveRecord::Migration
  def change
    drop_table(:user, {})
  end
end
