class SessionsController < ApplicationController

  def new
    @page_title = "Accede"
  end
  
  def create
    redirect_to signin_url
  end
end
