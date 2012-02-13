class ProblemsController < ApplicationController

  def destroy
    @problem=Problem.find(params[:id])
    @problem.destroy
    redirect_to :back
  end

  def new
     @problem=Problem.new
  end

  def create
     @problem=Problem.new(params[:problem])

     respond_to do |format|
       if @problem.save
         format.html {redirect_to '/problems', notice: 'Problem wurde erfolgreich erstellt.'}
         format.json {render json: @problem, status: :created, location: @problem}
       else
         format.html {render action: "new"}
         format.json {render json: @problem.errors, status: :unprocessable_entity}
       end
     end
  end

  def show
    $current_problem=Problem.find(params[:id])
    redirect_to problems_path
  end

  def index
    if $current_user==nil  #Bei direktem Aufruf von /problems zunächst auf Startseite verweisen, da sonst "called id on nil"-Fehler auftreten kann
    redirect_to root_path
    else
    @problems=Problem.find_all_by_user_id($current_user.id)
    end
  end


end
