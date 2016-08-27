ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'heroku.com',
  :user_name            => 'drillnote@gmail.com', # full email address (user@your.host.name.com)
  :password             => "bpglcmnbbqzaoioh",
  :authentication       => 'plain',
  :enable_starttls_auto => true
}