class ArchiveController < ApplicationController
  def index
    @list_posts = Post.blog.all
    @list_labs = Post.labs.all
  end

  private

  def initialize_for_layout
    @current_tab = :archive
    @current_title = :archive
  end
end