class CapusagesController < ApplicationController
     def view
     end
     def data
         @capusages = Capusage.all()
     end
     def dbaction
         #called for all db actions
         product_id = params["c0"]
         segment_id = params["c1"]
         preperiod_id = params["c2"]
         capusagevalue = params["c3"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 capusage = Capusage.new
                 capusage.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 capusage.segment_id = Segment.find_by_segmentname(segment_id).id
                 #finde zu Segmentnamen zugehörige ID
                 capusage.preperiod_id = Preperiod.find_by_preperiodnumber(preperiod_id).id
                 #finde zu Vorlaufperiode zugehörige ID
                 capusage.capusagevalue = capusagevalue
                 capusage.save!
                 
                 @tid = capusage.id
             when "deleted"
                 capusage=Capusage.find(@id)
                 capusage.destroy

                 @tid = @id
             when "updated"
                 capusage=Capusage.find(@id)
                 capusage.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 capusage.segment_id = Segment.find_by_segmentname(segment_id).id
                 #finde zu Segmentnamen zugehörige ID
                 capusage.preperiod_id = Preperiod.find_by_preperiodnumber(preperiod_id).id
                 #finde zu Vorlaufperiode zugehörige ID
                 capusage.capusagevalue = capusagevalue
                 capusage.save!
                 
                 @tid = @id
         end 
     end
end