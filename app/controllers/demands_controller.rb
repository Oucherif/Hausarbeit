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
                 demand.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 demand.timestep_id = Timestep.find_by_stepnumber(timestep_id).id
                 #finde zu Segmentnamen zugehörige ID
                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = demand.id
             when "deleted"
                 demand=Demand.find(@id)
                 demand.destroy

                 @tid = @id
             when "updated"
                 demand=Demand.find(@id)
                 demand.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 demand.timestep_id = Timestep.find_by_stepnumber(timestep_id).id
                 #finde zu Segmentnamen zugehörige ID
                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = @id
         end 
     end
end