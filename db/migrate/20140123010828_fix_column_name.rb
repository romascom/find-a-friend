class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :text, :description
  end
end
