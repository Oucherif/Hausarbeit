# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class SegmentsController < ApplicationController
     def view
       @title = "Segmente"

     end
     def data
         @segments = Segment.all()
     end
     def dbaction
         #called for all db actions
         segmentname = params["c0"]
         
         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 segment = Segment.new
                 segment.problem_id = $current_problem.id
                 segment.segmentname = segmentname
                 segment.save!
                 
                 @tid = segment.id
             when "deleted"
                 segment=Segment.find(@id)
                 segment.destroy
                 
                 @tid = @id
             when "updated"
                 segment=Segment.find(@id)
                 segment.problem_id = $current_problem.id
                 segment.segmentname = segmentname
                 segment.save!
                 
                 @tid = @id
         end 
     end
end