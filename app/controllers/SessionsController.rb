class SessionsController < ApplicationController
    def destroy
      session[:user_id] = nil
      flash[:success] = "Logout bem-sucedido!"
      redirect_to root_path
    end
  end
  def login
  end
  
  