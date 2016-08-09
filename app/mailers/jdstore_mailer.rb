class JdstoreMailer < ApplicationMailer
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.jdstore_mailer.invoice_confirm.subject
  #
  def order_notification(order)
    @order = order
    @customer = order.user
    @item_lists = order.item_lists

    mail to: @customer.email, subject: "JDstore.com order ... "
  end
end
