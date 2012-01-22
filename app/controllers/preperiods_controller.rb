# coding: utf-8                                               # erlaubt Sonderzeichen
class PreperiodsController < ApplicationController
  def new

    end

    def index
      @preperiods = Preperiod.new
      render 'new'
    end

    def create

      @preperiod = Preperiod.new(params[:preperiod])

      respond_to do |format|
        if @preperiod.save

          format.html {redirect_to(@preperiod, :notice => 'Vorlaufperioden wurden gespeichert.')}
          format.xml {render :xml => @preperiod, :status => created, :location => @preperiod}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @preperiod.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @preperiod = Preperiod.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @preperiod}
      end
    end

  end
