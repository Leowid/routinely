class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def home
  end

  def mixpanel
  	@mixpanel ||= Mixpanel::Tracker.new "5287867546633182809729700af3d405"
  end
end
