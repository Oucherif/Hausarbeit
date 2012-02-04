class TimestepsController < ApplicationController
     def view
     end
     def data
         @timesteps = Timestep.all()
     end
     def dbaction
         #called for all db actions
         stepnumber = params["c0"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 timestep = Timestep.new
                 timestep.stepnumber = stepnumber
                 timestep.save!

                 @tid = timestep.id

             when "deleted"
                 timestep=Timestep.find(@id)
                 timestep.destroy

                 @tid = @id

             when "updated"
                 timestep=Timestep.find(@id)
                 timestep.stepnumber = stepnumber
                 timestep.save!

                 @tid = @id

         end
     end
end