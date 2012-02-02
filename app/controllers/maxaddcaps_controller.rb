class MaxaddcapsController < ApplicationController
     def view
     end
     def data
         @maxaddcaps = Maxaddcap.all()
     end
     def dbaction
         #called for all db actions
         segmentname = params["c0"]
         stepnumber = params["c1"]
         maxaddcapvalue = params["c2"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 maxaddcap = Maxaddcap.new
                 maxaddcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 #finde zu Segmentnamen zugehörige ID
                 maxaddcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 #finde zu Segmentnamen zugehörige ID
                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = maxaddcap.id
             when "deleted"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.destroy

                 @tid = @id
             when "updated"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 #finde zu Segmentnamen zugehörige ID
                 maxaddcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 #finde zu Segmentnamen zugehörige ID
                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = @id
         end 
     end
end