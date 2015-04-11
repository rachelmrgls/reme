class ClientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.account_activation.subject
  #
  def account_activation(client)
    @client = client
    mail to: client.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.password_reset.subject
  #
  def password_reset(client)
    @client = client
    mail to: client.email, subject: "Password reset"
  end
end
