class PasswordsController < ApplicationController
  def new
    # Exibe o formulário para solicitar a redefinição de senha
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_reset_password_token
      flash[:notice] = 'Instruções de redefinição de senha enviadas para seu e-mail.'
      redirect_to login_path
    else
      flash[:alert] = 'E-mail não encontrado.'
      render :new
    end
  end
  

  def edit
    @token = params[:token]
    # Exibe o formulário para redefinir a senha
  end

  def update
    user = User.find_by(reset_password_token: params[:token])
    if user && user.reset_password_token_valid?
      if user.update(raw_password: params[:password], raw_password_confirmation: params[:password_confirmation])
        flash[:notice] = 'Senha atualizada com sucesso.'
        redirect_to login_path
      else
        flash[:alert] = 'Não foi possível atualizar a senha.'
        render :edit
      end
    else
      flash[:alert] = 'Token inválido ou expirado.'
      redirect_to new_password_path
    end
  end

end
