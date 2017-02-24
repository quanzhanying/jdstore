class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default from: "service@jdstore.com"
  layout 'mailer'
end
