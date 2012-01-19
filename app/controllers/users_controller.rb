# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Registrierung"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Willkommen auf HPPLAN Online!"       #Willkommensgruß angepasst
      redirect_to @user
    else
      @title = "Registrierung"
      @user.password =""                                      #Passwort bei Fehler zurückgesetzt
      @user.password_confirmation=""                          #Passwort bei Fehler zurückgesetzt
      render 'new'
    end
  end
end