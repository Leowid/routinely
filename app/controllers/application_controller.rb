class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def home
  end
end
