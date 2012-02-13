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
                 maxaddcap.problem_id = $current_problem.id
                 if Segment.find_by_segmentname(segmentname)==nil
                   maxaddcap.segment_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   maxaddcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   maxaddcap.timestep_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   maxaddcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = maxaddcap.id
             when "deleted"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.destroy

                 @tid = @id
             when "updated"
                 maxaddcap=Maxaddcap.find(@id)
                 maxaddcap.problem_id = $current_problem.id
                 if Segment.find_by_segmentname(segmentname)==nil
                   maxaddcap.segment_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   maxaddcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   maxaddcap.timestep_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   maxaddcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end

                 maxaddcap.maxaddcapvalue = maxaddcapvalue
                 maxaddcap.save!
                 
                 @tid = @id
         end 
     end
end