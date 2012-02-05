class AddcapcostsController < ApplicationController
     def view
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