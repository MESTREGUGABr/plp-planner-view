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
  
    if user
      if user.reset_password_token.nil?
        # Se o token já foi utilizado e invalidado
        flash[:error] = 'Este link já foi utilizado para redefinir a senha. Por favor, solicite uma nova redefinição de senha.'
        redirect_to new_password_path
      elsif user.reset_password_token_valid?
        if user.update(raw_password: params[:password], raw_password_confirmation: params[:password_confirmation])
          user.invalidate_reset_password_token # Invalida o token após o uso
          flash[:success] = 'Senha atualizada com sucesso.'
          redirect_to login_path
        else
          flash[:error] = 'Não foi possível atualizar a senha.'
          render :edit
        end
      else
        # Se o token expirou
        flash[:aleerrorrt] = 'O token de redefinição de senha expirou. Por favor, solicite uma nova redefinição de senha.'
        redirect_to new_password_path
      end
    else
      # Se o token é inválido
      flash[:error] = 'Token inválido ou expirado. Por favor, solicite uma nova redefinição de senha.'
      redirect_to new_password_path
    end
  end  
end
