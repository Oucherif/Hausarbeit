# coding: utf-8                                               # erlaubt Sonderzeichen
class ProdcapsController < ApplicationController
  def new

    end

    def index
      @prodcaps = Prodcap.new
      render 'new'
    end

    def create

      @prodcap = Prodcap.new(params[:prodcap])

      respond_to do |format|
        if @prodcap.save

          format.html {redirect_to(@prodcap, :notice => 'Produktionskapazität wurde gespeichert.')}
          format.xml {render :xml => @prodcap, :status => created, :location => @prodcap}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @prodcap.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @prodcap = Prodcap.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @prodcap}
      end
    end

  end
