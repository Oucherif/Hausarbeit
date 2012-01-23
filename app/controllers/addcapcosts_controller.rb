class AddcapcostsController < ApplicationController
     def view
     end
     def data
         @addcapcosts = Addcapcost.all()
     end
     def dbaction
         #called for all db actions
         timestep_id = params["c0"]
         addcapcostvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 addcapcost = Addcapcost.new
                 addcapcost.timestep_id = timestep_id
                 addcapcost.addcapcostvalue = addcapcostvalue
                 addcapcost.save!
                 
                 @tid = addcapcost.id
             when "deleted"
                 addcapcost=Addcapcost.find(@id)
                 addcapcost.destroy

                 @tid = @id
             when "updated"
                 addcapcost=Addcapcost.find(@id)
                 addcapcost.timestep_id = timestep_id
                 addcapcost.addcapcostvalue = addcapcostvalue
                 addcapcost.save!
                 
                 @tid = @id
         end 
     end
end