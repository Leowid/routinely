# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Routinely::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address                => "smtp.sendgrid.com",
    :port                   => 587,
    :domain                 => "zenflow.io",
    :user_name              => "leowid",
    :password               => "--ruler--",
    :authentication     => "plain",
    :enable_starttls_auto   => true
}