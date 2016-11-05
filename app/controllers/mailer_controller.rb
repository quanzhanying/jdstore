class MailerController < ApplicationController
  def OrderMailer
    @mailers = Mailer.index
  end
  # def mail_to_customer
  #   if Rails.env == "devlopment"
  #     do_
  #   else
  #     do
  #     end
  #   end

end
