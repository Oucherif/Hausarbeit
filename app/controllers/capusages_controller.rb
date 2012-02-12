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
                 if Product.find_by_productname(productname)==nil             #verhindere nil.id Fehler
                   capusage.product_id=nil
                 else       #finde zu Produktnamen zugehörige ID
                   capusage.product_id = Product.find_by_productname(productname).id
                 end

                 if Segment.find_by_segmentname(segmentname)==nil             #verhindere nil.id Fehler
                   capusage.segment_id=nil
                 else       #finde zu Segmentnamen zugehörige ID
                   capusage.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Product.find_by_productname(productname).id==nil          #verhindere nil.id Fehler
                   capusage.preperiod_id=nil
                 else
                   if Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber)==nil #verhindere nil.id Fehler
                      capusage.preperiod_id=nil
                   else    #finde zu Vorlaufperiode zugehörige ID
                     capusage.preperiod_id = Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber).id
                   end
                 end


                 capusage.capusagevalue = capusagevalue
                 capusage.save!
                 
                 @tid = capusage.id
             when "deleted"
                 capusage=Capusage.find(@id)
                 capusage.destroy

                 @tid = @id
             when "updated"
                 capusage=Capusage.find(@id)
                 if Product.find_by_productname(productname)==nil             #verhindere nil.id Fehler
                   capusage.product_id=nil
                 else       #finde zu Produktnamen zugehörige ID
                   capusage.product_id = Product.find_by_productname(productname).id
                 end

                 if Segment.find_by_segmentname(segmentname)==nil             #verhindere nil.id Fehler
                   capusage.segment_id=nil
                 else       #finde zu Segmentnamen zugehörige ID
                   capusage.segment_id = Segment.find_by_segmentname(segmentname).id
                 end

                 if Product.find_by_productname(productname).id==nil          #verhindere nil.id Fehler
                   capusage.preperiod_id=nil
                 else
                   if Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber)==nil #verhindere nil.id Fehler
                      capusage.preperiod_id=nil
                   else    #finde zu Vorlaufperiode zugehörige ID
                     capusage.preperiod_id = Preperiod.find_by_product_id_and_preperiodnumber(Product.find_by_productname(productname).id, preperiodnumber).id
                   end
                 end

                 capusage.capusagevalue = capusagevalue
                 capusage.save!
                 @tid = @id
         end 
     end
end