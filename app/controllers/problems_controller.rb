class ProblemsController < ApplicationController
  def new

  end

  def index
    @products = Product.new
    @addcapcosts = Addcapcost.new
    @capusages = Capusage.new
    @demands = Demand.new
    @maxaddcaps = Maxaddcap.new
    @preperiods = Preperiod.new
    @prodcaps = Prodcap.new
    @segments = Segment.new
    @storagecosts = Storagecost.new
    @timesteps = Timestep.new
    render 'new'
  end

end
