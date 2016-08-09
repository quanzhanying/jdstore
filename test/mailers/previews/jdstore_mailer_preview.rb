# Preview all emails at http://localhost:3000/rails/mailers/jdstore_mailer
class JdstoreMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/jdstore_mailer/invoice_confirm
  def invoice_confirm
    JdstoreMailer.invoice_confirm
  end

end
