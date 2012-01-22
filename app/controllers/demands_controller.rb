# coding: utf-8                                               # erlaubt Sonderzeichen
class DemandsController < ApplicationController
  def new

    end

    def index
      @demands = Demand.new
      render 'new'
    end

    def create

      @demand = Demand.new(params[:demand])

      respond_to do |format|
        if @demand.save

          format.html {redirect_to(@demand, :notice => 'Nachfrage wurde gespeichert.')}
          format.xml {render :xml => @demand, :status => created, :location => @demand}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @demand.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @demand = Demand.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @demand}
      end
    end

  end
