# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class AddcapcostsController < ApplicationController
     def view
       @title = "Kosten für Zusatzkapazitäten"
     end
     def data
         @addcapcosts = Addcapcost.all()
     end
     def dbaction
         #called for all db actions
         stepnumber = params["c0"]
         addcapcostvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 addcapcost = Addcapcost.new
                 addcapcost.problem_id = $current_problem.id
                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   addcapcost.timestep_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   addcapcost.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 addcapcost.addcapcostvalue = addcapcostvalue
                 addcapcost.save!
                 
                 @tid = addcapcost.id
             when "deleted"
                 addcapcost=Addcapcost.find(@id)
                 addcapcost.destroy

                 @tid = @id
             when "updated"
                 addcapcost=Addcapcost.find(@id)
                 addcapcost.problem_id = $current_problem.id
                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   addcapcost.timestep_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   addcapcost.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 addcapcost.addcapcostvalue = addcapcostvalue
                 addcapcost.save!
                 
                 @tid = @id
         end 
     end
end