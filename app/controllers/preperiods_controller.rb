class PreperiodsController < ApplicationController
     def view
     end
     def data
         @preperiods = Preperiod.all()
     end
     def dbaction
         #called for all db actions
         product_id = params["c0"]
         preperiodnumber = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 preperiod = Preperiod.new
                 preperiod.product_id = product_id
                 preperiod.preperiodnumber = preperiodnumber
                 preperiod.save!
                 
                 @tid = preperiod.id
             when "deleted"
                 preperiod=Preperiod.find(@id)
                 preperiod.destroy

                 @tid = @id
             when "updated"
                 preperiod=Preperiod.find(@id)
                 preperiod.product_id = product_id
                 preperiod.preperiodnumber = preperiodnumber
                 preperiod.save!
                 
                 @tid = @id
         end 
     end
end