# coding: utf-8                                               # erlaubt Sonderzeichen
class StoragecostsController < ApplicationController
  def new

    end

    def index
      @storagecosts = Storagecost.new
      render 'new'
    end

    def create

      @storagecost = Storagecost.new(params[:storagecost])

      respond_to do |format|
        if @storagecost.save

          format.html {redirect_to(@storagecost, :notice => 'Lagerhaltungskosten wurden gespeichert.')}
          format.xml {render :xml => @storagecost, :status => created, :location => @storagecost}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @storagecost.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @storagecost = Storagecost.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @storagecost}
      end
    end

  end
