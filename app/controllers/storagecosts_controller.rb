class StoragecostsController < ApplicationController
     def view
     end
     def data
         @storagecosts = Storagecost.all()
     end
     def dbaction
         #called for all db actions
         product_id = params["c0"]
         storagecostvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 storagecost = Storagecost.new
                 storagecost.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 storagecost.storagecostvalue = storagecostvalue
                 storagecost.save!
                 
                 @tid = storagecost.id
             when "deleted"
                 storagecost=Storagecost.find(@id)
                 storagecost.destroy
                 
                 @tid = @id
             when "updated"
                 storagecost=Storagecost.find(@id)
                 storagecost.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 storagecost.storagecostvalue = storagecostvalue
                 storagecost.save!
                 
                 @tid = @id
         end 
     end
end