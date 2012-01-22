class ProductsController < ApplicationController
  def new

  end

  def index
    @products = Product.new
    render 'new'
  end

  def create

    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html {redirect_to(@product, :notice => 'Produkt wurde gespeichert.')}
        format.xml {render :xml => @product, :status => created, :location => @product}
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @product.errors, :status => unprocessable_entity}
      end
    end

  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
        format.html
        format.xml {render :xml => @product}
    end
  end

end
