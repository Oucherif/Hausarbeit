class SegmentsController < ApplicationController
  def new

  end

  def index
    @segments = Segment.new
    render 'new'
  end

  def create

    @segment = Segment.new(params[:segment])

    respond_to do |format|
      if @segment.save
        format.html {redirect_to(@segment, :notice => 'Segment wurde gespeichert.')}
        format.xml {render :xml => @segment, :status => created, :location => @segment}
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @segment.errors, :status => unprocessable_entity}
      end
    end

  end

  def show
    @segment = Segment.find(params[:id])

    respond_to do |format|
        format.html
        format.xml {render :xml => @segment}
    end
  end

end
