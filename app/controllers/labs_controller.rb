class LabsController < ApplicationController

  MAX_LABS = 10

  def index
    @labs = Post.labs.where(:visible => true).limit(MAX_LABS)
    @labs_draft = Post.labs.where(:visible => false)
  end

  private

  def initialize_for_layout
    @current_tab = :labs
  end
end