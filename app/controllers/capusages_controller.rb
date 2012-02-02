class CapusagesController < ApplicationController
     def view
     end
     def data
         @capusages = Capusage.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         segmentname = params["c1"]
         preperiodnumber = params["c2"]
         capusagevalue = params["c3"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 capusage = Capusage.new
                 capusage.product_id = Product.find_by_productname(productname).id
                 #finde zu Produktnamen zugehörige ID
                 capusage.segment_id = Segment.find_by_segmentname(segmentname).id
                 #finde zu Segmentnamen zugehörige ID
                 capusage.preperiod_id = Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber).id
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
                 capusage.product_id = Product.find_by_productname(productname).id
                 #finde zu Produktnamen zugehörige ID
                 capusage.segment_id = Segment.find_by_segmentname(segmentname).id
                 #finde zu Segmentnamen zugehörige ID
                 capusage.preperiod_id = Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber).id
                 #finde zu Vorlaufperiode zugehörige ID
                 capusage.capusagevalue = capusagevalue
                 capusage.save!
                 
                 @tid = @id
         end 
     end
end