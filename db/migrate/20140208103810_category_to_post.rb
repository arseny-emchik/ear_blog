class CategoryToPost < ActiveRecord::Migration
  def change
    add_column :posts, :category, :CHAR, :null => false
  end
end
