class TimestepsController < ApplicationController
     def view
         @timesteps = Timestep.new
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
                 b = !timestep.save
                 logger.info timestep.to_s
                 if b
                    flash.now[:error] = "Blubdiwub."
                    redirect_to :action => "view"
                    logger.info "Blubdiwub "+b.to_s
                 else
                    logger.info "Kein Blubdiwub "+b.to_s
                 end

                 @tid = timestep.id

             when "deleted"
                 timestep=Timestep.find(@id)
                 timestep.destroy

                 @tid = @id

             when "updated"
                 timestep=Timestep.find(@id)
                 timestep.stepnumber = stepnumber
                 b = !timestep.save
                 logger.info timestep.stepnumber.to_s
                 if b
                    flash.now[:error] = "Blubdiwub."
                    redirect_to :action => "view"
                    logger.info "Blubdiwub "+b.to_s
                 else
                    logger.info "Kein Blubdiwub "+b.to_s
                 end

                 @tid = @id

         end
     end
end