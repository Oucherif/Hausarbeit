# coding: utf-8                                               # erlaubt Sonderzeichen
class CapusagesController < ApplicationController
  def new

    end

    def index
      @capusages = Capusage.new
      render 'new'
    end

    def create

      @capusage = Capusage.new(params[:capusage])

      respond_to do |format|
        if @capusage.save

          format.html {redirect_to(@capusage, :notice => 'Kapazitätsbelastung wurde gespeichert.')}
          format.xml {render :xml => @capusage, :status => created, :location => @capusage}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @capusage.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @capusage = Capusage.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @capusage}
      end
    end

  end
