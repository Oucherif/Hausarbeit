# coding: utf-8                                               # erlaubt Sonderzeichen
class TimestepsController < ApplicationController
  def new

    end

    def index
      @timesteps = Timestep.new
      render 'new'
    end

    def create

      @timestep = Timestep.new(params[:timestep])

      respond_to do |format|
        if @timestep.save

          format.html {redirect_to(@timestep, :notice => 'Zeitintervall wurde gespeichert.')}
          format.xml {render :xml => @timestep, :status => created, :location => @timestep}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @timestep.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @timestep = Timestep.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @timestep}
      end
    end

  end
