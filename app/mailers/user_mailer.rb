class UserMailer < ApplicationMailer
    def reset_password_email(user)
      @user = user
      @token = user.reset_password_token
      mail(to: @user.email, subject: 'Instruções para redefinir a senha')
      Rails.logger.info("E-mail de redefinição de senha enviado para #{@user.email}")
    end
  end
  