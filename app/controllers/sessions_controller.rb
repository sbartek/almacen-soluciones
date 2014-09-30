# -*- coding: utf-8 -*-

class SessionsController < ApplicationController

  def new
    @page_title = "Accede"
  end
  
  def create
    usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if usuario && usuario.authenticate(params[:session][:password])
      sign_in usuario
      flash[:notice] = 'Login incorrecto.'
      redirect_to root_url
    else
      # Create an error message and re-render the signin form.
      flash[:notice] = 'Login incorrecto.'
      redirect_to signin_url
    end
  end
end
