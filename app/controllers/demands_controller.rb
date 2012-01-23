class DemandsController < ApplicationController
     def view
     end
     def data
         @demands = Demand.all()
     end
     def dbaction
         #called for all db actions
         product_id = params["c0"]
         timestep_id = params["c1"]
         demandvalue = params["c2"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 demand = Demand.new
                 demand.product_id = product_id
                 demand.timestep_id = timestep_id
                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = demand.id
             when "deleted"
                 demand=Demand.find(@id)
                 demand.destroy

                 @tid = @id
             when "updated"
                 demand=Demand.find(@id)
                 demand.product_id = product_id
                 demand.timestep_id = timestep_id
                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = @id
         end 
     end
end