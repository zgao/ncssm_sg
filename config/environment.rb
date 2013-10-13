# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sg::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  user_name: 'app18655078@heroku.com',
  password: 'mmrceyg2',
  domain: 'heroku.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
