class Post < ActiveRecord::Base

  #attr_accessible :author, :title, :brief_text, :text, :visible

  validates_presence_of :author, :title, :brief_text, :text

end