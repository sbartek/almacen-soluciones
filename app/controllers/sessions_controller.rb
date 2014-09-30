# -*- coding: utf-8 -*-

class SessionsController < ApplicationController

  def new
    @page_title = "Accede"
  end
  
  def create
    user = Usuario.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to root_url
    else
      # Create an error message and re-render the signin form.
      flash[:notice] = 'Login incorrecto.'
      redirect_to signin_url
    end
  end
end
