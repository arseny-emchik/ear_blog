class TimeOfPublicationPost < ActiveRecord::Migration
  def change
    add_column :posts, :publication_time, :datetime, :null => true
  end
end
