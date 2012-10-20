# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Happy::Application.initialize!

ActionMailer::Base.smtp_settings = {
      :address        => "smtp.sendgrid.net",
      :port           => "25",
      :authentication => :plain,
      :user_name      => ENV['SENDGRID_USERNAME'],
      :password       => ENV['SENDGRID_PASSWORD'],
      :domain         => 'http://boiling-brook-1806.herokuapp.com'
    }