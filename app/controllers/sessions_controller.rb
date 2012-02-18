# encoding: utf-8
# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class SessionsController < ApplicationController

  def new
    @title = "Anmelden"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Unzulässige E-Mail/Passwort-Kombination."
      @title = "Anmelden"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    $current_problem=nil
    sign_out
    redirect_to root_path
  end
end