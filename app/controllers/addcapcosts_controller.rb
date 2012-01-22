# coding: utf-8                                               # erlaubt Sonderzeichen
class AddcapcostsController < ApplicationController
  def new

    end

    def index
      @addcapcosts = Addcapcost.new
      render 'new'
    end

    def create

      @addcapcost = Addcapcost.new(params[:addcapcost])

      respond_to do |format|
        if @addcapcost.save

          format.html {redirect_to(@addcapcost, :notice => 'Kosten für Zusatzkapazität wurden gespeichert.')}
          format.xml {render :xml => @addcapcost, :status => created, :location => @addcapcost}
        else
          format.html {render :action => "new"}
          format.xml {render :xml => @addcapcost.errors, :status => unprocessable_entity}
        end
      end

    end

    def show
      @addcapcost = Addcapcost.find(params[:id])

      respond_to do |format|
          format.html
          format.xml {render :xml => @addcapcost}
      end
    end

  end
