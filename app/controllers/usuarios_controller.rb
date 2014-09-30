# -*- coding: utf-8 -*-

class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @usuario.update_attributes(params_usuario)
      flash[:notice]="El perfil esta actualizado."
      redirect_to @usuario
    else
      render :edit
    end

  end


  private
  
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def params_usuario
      params.require(:usuario).permit(:name, :email, :password,
                                      :password_confirmation)
    end

end
