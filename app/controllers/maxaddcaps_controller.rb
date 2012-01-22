# coding: utf-8                                               # erlaubt Sonderzeichen
class MaxaddcapsController < ApplicationController
  def new

    end

    def index
      @maxaddcaps = Maxaddcap.new
      render 'new'
    end

    def create

      @maxaddcap = Maxaddcap.new(params[:maxaddcap])

      respond_to do |format|
        if @maxaddcap.save

          format.html {redirect_to(@maxaddcap, :notice => 'Maximale Zusatzkapazität wurde gespeichert.')}
          format.xml {render :xml => @maxaddcap, :status => created, :location => @maxaddcap}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @maxaddcap.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @maxaddcap = Maxaddcap.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @maxaddcap}
      end
    end

  end
