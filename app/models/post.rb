class Post < ActiveRecord::Base

  default_scope order('created_at desc')
  scope :blog, -> {where(:category => Post::POST)}
  scope :labs, -> {where(:category => Post::LAB)}
  validates_presence_of :author, :title, :brief_text, :text, :category


  POST = 'p'.freeze
  LAB = 'l'.freeze

end