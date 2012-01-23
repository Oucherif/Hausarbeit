class ProdcapsController < ApplicationController
     def view
     end
     def data
         @prodcaps = Prodcap.all()
     end
     def dbaction
         #called for all db actions
         segment_id = params["c0"]
         timestep_id = params["c1"]
         prodcapvalue = params["c2"]
         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 prodcap = Prodcap.new
                 prodcap.segment_id = segment_id
                 prodcap.timestep_id = timestep_id
                 prodcap.prodcapvalue = prodcapvalue
                 prodcap.save!
                 
                 @tid = prodcap.id
             when "deleted"
                 prodcap=Prodcap.find(@id)
                 prodcap.destroy

                 @tid = @id
             when "updated"
                 prodcap=Prodcap.find(@id)
                 prodcap.segment_id = segment_id
                 prodcap.timestep_id = timestep_id
                 prodcap.prodcapvalue = prodcapvalue
                 prodcap.save!
                 
                 @tid = @id
         end 
     end
end