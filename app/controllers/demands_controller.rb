# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class DemandsController < ApplicationController
     def view
       @title = "Nachfrage"

     end
     def data
         @demands = Demand.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         stepnumber = params["c1"]
         demandvalue = params["c2"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 demand = Demand.new
                 demand.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   demand.product_id = nil
                 else  #finde zu Produktnamen zugehörige ID
                   demand.product_id = Product.find_by_productname(productname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                  demand.timestep_id =nil
                 else   #finde zu Segmentnamen zugehörige ID
                  demand.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = demand.id
             when "deleted"
                 demand=Demand.find(@id)
                 demand.destroy

                 @tid = @id
             when "updated"
                 demand=Demand.find(@id)
                 demand.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   demand.product_id = nil
                 else  #finde zu Produktnamen zugehörige ID
                   demand.product_id = Product.find_by_productname(productname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                  demand.timestep_id =nil
                 else   #finde zu Segmentnamen zugehörige ID
                  demand.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 demand.demandvalue = demandvalue
                 demand.save!
                 
                 @tid = @id
         end 
     end
end