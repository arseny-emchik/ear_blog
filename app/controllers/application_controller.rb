class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Russian.init_i18n

  layout 'main_view'

  before_filter :initialize_for_layout

  private

  def initialize_for_layout

  end

end
