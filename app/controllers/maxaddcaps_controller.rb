class MaxaddcapsController < ApplicationController
     def view
     end
     def data
         @maxaddcaps = Maxaddcap.all()
     end
     def dbaction
         #called for all db actions
         segment_id = params["c0"]
         timestep_id = params["c1"]
         maxaddcapvalue = params["c2"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 maxaddcap = Maxaddcap.new
                 maxaddcap.segment_id = segment_id
                 maxaddcap.timestep_id = timestep_id
                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = maxaddcap.id
             when "deleted"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.destroy

                 @tid = @id
             when "updated"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.segment_id = segment_id
                 maxaddcap.timestep_id = timestep_id
                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = @id
         end 
     end
end