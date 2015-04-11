# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/account_activation
  def account_activation
    ClientMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/password_reset
  def password_reset
    ClientMailer.password_reset
  end

end
