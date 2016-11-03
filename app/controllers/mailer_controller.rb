class MailerController < ApplicationController
  def OrderMailer
    @mailers = Mailer.index
  end


end
