class ApplicationMailer < ActionMailer::Base
  default from: ENV["HOST_MAIL"]
  layout "mailer"
end
