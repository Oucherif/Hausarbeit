# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class ProdcapsController < ApplicationController
     def view
       @title = "Produktionskapazitäten"

     end
     def data
         @prodcaps = Prodcap.all()
     end
     def dbaction
         #called for all db actions
         segmentname = params["c0"]
         stepnumber = params["c1"]
         prodcapvalue = params["c2"]
         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 prodcap = Prodcap.new
                 prodcap.problem_id = $current_problem.id
                 if Segment.find_by_segmentname(segmentname)==nil
                   prodcap.segment_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   prodcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   prodcap.timestep_id=nil
                 else #finde zu Zeitpunkt zugehörige ID
                   prodcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end
                 prodcap.prodcapvalue = prodcapvalue
                 prodcap.save!
                 
                 @tid = prodcap.id
             when "deleted"
                 prodcap=Prodcap.find(@id)
                 prodcap.destroy

                 @tid = @id
             when "updated"
                 prodcap=Prodcap.find(@id)
                 prodcap.problem_id = $current_problem.id
                 if Segment.find_by_segmentname(segmentname)==nil
                   prodcap.segment_id=nil
                 else  #finde zu Segmentnamen zugehörige ID
                   prodcap.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Timestep.find_by_stepnumber(stepnumber)==nil
                   prodcap.timestep_id=nil
                 else #finde zu Zeitpunkt zugehörige ID
                   prodcap.timestep_id = Timestep.find_by_stepnumber(stepnumber).id
                 end
                 prodcap.prodcapvalue = prodcapvalue
                 prodcap.save!
                 
                 @tid = @id
         end 
     end
end