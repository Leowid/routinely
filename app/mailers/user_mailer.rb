class UserMailer < ActionMailer::Base
  default :from => "leo@zenflow.io"
  
  # send a signup email to the user, pass in the user object that contains the user’s email address
  def signup_email(user)
  	@user = user
    mail( :to => user.email,
    :subject => "Leo from Zenflow - awesome to have you on board!" )
  end
end

