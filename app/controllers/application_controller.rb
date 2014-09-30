# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :signin_usuario

  private

    def signin_usuario
      redirect_to signin_url, notice: "Inicia sessión, por favor." unless signed_in?
    end

end
